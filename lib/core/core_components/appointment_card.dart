
import 'package:Pationt_Donor/modules/patient/data/model/my_appointment_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_appointment_controller.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/const_colors.dart';

class MyAppointmentCard extends StatefulWidget {
  const MyAppointmentCard({
    super.key,
    required this.model,
    required this.index,
  });

  final Data model;
  final int index;

  @override
  State<MyAppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<MyAppointmentCard> {
  bool isAccepting = false;
  bool isRejecting = false;
  bool isAccepted = false;
  bool isDeleted = false;
  MyAppointmentController controller = Get.find<MyAppointmentController>();

  @override
  Widget build(BuildContext context) {
    final doctor = widget.model.doctor;
    final String? photoUrl = doctor?.imageUrl;

    String _initials() {
      final f = (doctor?.firstName ?? '').trim();
      final l = (doctor?.lastName ?? '').trim();
      if (f.isEmpty && l.isEmpty) return '?';
      return ((f.isNotEmpty ? f[0] : '') + (l.isNotEmpty ? l[0] : ''))
          .toUpperCase();
    }

    if (isDeleted) return const SizedBox.shrink();

    return Padding(
      padding:
          EdgeInsets.all(0.5.vmin),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ConstColors.darkBlue,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5.vmin)),
        borderOnForeground: true,
        color: Colors.white54,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  "${doctor?.firstName ?? ''} ${doctor?.lastName ?? ''}",
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(color: Colors.indigo),
                ),
                subtitle: Text(
                  "اليوم: ${widget.model.workDay ?? '-'}\n"
                  "الوقت: ${widget.model.workTime ?? '-'}\n"
                  "الحالة: ${_translateStatus(widget.model.meetStatus)}\n"
                  "الكلفة: ${widget.model.meetCost!.toString()} ل.س ",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                
                trailing: CircleAvatar(
  radius: 7.vmin,
  backgroundColor: Colors.transparent,
  child: (widget.model.doctor?.imageUrl != null && widget.model.doctor!.imageUrl!.isNotEmpty)
      ? ClipOval(
          child: ExtendedImage.network(
            widget.model.doctor!.imageUrl!,
            width: 20.w,
            height: 20.w,
            fit: BoxFit.cover,
          ),
        )
      : Icon(
          Icons.person,
          size: 5.w,
          color: ConstColors.darkBlue,
        ),
),

              ),

              SizedBox(height: 2.vmin),

              // ✅ إذا في تحميل (قبول أو رفض) يطلع اللودر بنص البطاقة
              if (isAccepting || isRejecting)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.vmin),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 0.8.vmin,
                      color: ConstColors.darkBlue,
                    ),
                  ),
                )
              else if (widget.model.meetStatus == "scheduled") // الأزرار بس إذا ما قبل الموعد
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // زر القبول
                    SizedBox(
                      width: 25.vmin,
                      height: 10.vmin,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() => isAccepting = true);
                          await controller.accept(widget.model.id!);
                          setState(() {
                            isAccepting = false;
                            isAccepted = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.vmin),
                            side: const BorderSide(color: Colors.green),
                          ),
                        ),
                        child: Text(
                          "قبول",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.indigo,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    // زر الرفض
                    SizedBox(
                      width: 25.vmin,
                      height: 10.vmin,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() => isRejecting = true);
                          await controller.reject(widget.model.id!);
                          await Future.delayed(const Duration(seconds: 1));
                          setState(() {
                            isDeleted = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.vmin),
                            side: const BorderSide(color: Colors.red),
                          ),
                        ),
                        child: Text(
                          "رفض",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 3.vmin),
            ],
          ),
        ),
      ),
    );
  }
}

String _translateStatus(String? status) {
  switch (status) {
    case "accepted":
      return "مقبولة";
    case "rejected":
      return "مرفوضة";
    case "scheduled":
      return "مجدولة";
    default:
      return "-";
  }
}

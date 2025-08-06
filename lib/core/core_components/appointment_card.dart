import 'package:Pationt_Donor/modules/patient/data/model/my_appointment_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_appointment_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/my_appointments.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/patient/data/model/consultation_model.dart';
import '../../modules/patient/presentation/controllers/home_controller.dart';
import '../const/const_colors.dart';

class MyAppointmentCard extends StatefulWidget {
  const MyAppointmentCard({
    super.key,
    required this.model,
    required this.index,

    //  required this.model,
    //   required this.index
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
      padding: EdgeInsets.only(
          right: 1.vmin, left: 5.vmin, top: 1.vmin, bottom: 1.vmin),
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
          padding: EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  "${doctor?.firstName ?? ''} ${doctor?.lastName ?? ''}",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.indigo),
                ),
                subtitle: Text(
                  " اليوم: ${widget.model.workDay ?? '-'}\n"
                  "الوقت: ${widget.model.workTime ?? '-'}\n"
                  "الحالة: ${widget.model.meetStatus ?? '-'}\n"
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
                  backgroundColor: Colors.white54,
                  radius: 5.5.vmin,
                  backgroundImage: (photoUrl != null && photoUrl.isNotEmpty)
                      ? NetworkImage(photoUrl)
                      : null,
                  child: (photoUrl == null || photoUrl.isEmpty)
                      ? Text(
                          _initials(),
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : 
                   Icon(
                    Icons.person,
                    color: Colors.indigo,
                  ),
                ),
              ),
              SizedBox(
                height: 2.vmin,
              ),
              if (!isAccepted && !isRejecting)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isAccepting
                        ? SizedBox(
                            width: 3.vmin,
                            height: 200,
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5.vmin,
                              color: ConstColors.darkBlue,
                            ),
                          )
                        : SizedBox(
                            width: 25.vmin,
                            height: 10.vmin,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() => isAccepting = true);
                                controller.accept(widget.model.id!);
                                setState(() {
                                  isAccepting = false;
                                  isAccepted =
                                      true; // ✅ إخفاء الأزرار بعد القبول
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
                                  fontSize: 10.spa,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                    isRejecting
                        ? SizedBox(
                            width: 3.vmin,
                            height: 3.vmin,
                            child: CircularProgressIndicator(
                              strokeWidth: 0.5.vmin,
                              color: ConstColors.darkBlue,
                            ),
                          )
                        : SizedBox(
                            width: 25.vmin,
                            height: 10.vmin,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() => isRejecting = true);
                                controller.reject(widget.model.id!);
                                await Future.delayed(Duration(seconds: 1));
                                setState(() {
                                  isDeleted = true; // ✅ حذف البطاقة بعد الرفض
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                //foregroundColor: Colors.white,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.vmin),
                                  side: const BorderSide(color: Colors.red),
                                ),
                              ),
                              child: Text(
                                "رفض",
                                style: TextStyle(
                                  fontSize: 10.spa,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          
                  ],
                ),
                SizedBox(
                  height: 3.vmin,
                )
            ],
          ),
        ),
      ),
    );
  }
}

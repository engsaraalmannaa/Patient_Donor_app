import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_consultation_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/edit_consultation.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_consultation_model.dart';

class ConsultationDetailsScreen extends StatefulWidget {
  final Consultation consultation;

  const ConsultationDetailsScreen({super.key, required this.consultation});

  static const name = '/consultationdetail';
  static final page = GetPage(
    name: name,
    page: () {
      final Consultation consultation = Get.arguments as Consultation;
      return ConsultationDetailsScreen(consultation: consultation);
    },
  );

  @override
  State<ConsultationDetailsScreen> createState() =>
      _ConsultationDetailsScreenState();
}

class _ConsultationDetailsScreenState extends State<ConsultationDetailsScreen> {
  MyConsultationController controller =
      Get.put<MyConsultationController>(MyConsultationController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.vmin),
              ),
            ),
            leading: Padding(
              padding: EdgeInsets.only(right: 4.vmin),
              child: Image.asset(
                "assets/images/logoo.png",
                width: 25.vmin,
              ),
            ),
            title: Text(
              "تفاصيل الاستشارة",
              style: TextStyle(
                fontSize: 12.5.spa,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 7.vmin,
                ),
                onPressed: () async {
                  final result = await Get.to(
                    () => EditConsultationScreen(
                      consultation: widget.consultation,
                    ),
                  );

                  if (result != null && result?['refresh'] == true) {
                    Consultation updatedConsultation = result['consultation'];

                    widget.consultation.id = updatedConsultation.id;
                    widget.consultation.specialtyId =
                        updatedConsultation.specialtyId;
                    widget.consultation.patientId =
                        updatedConsultation.patientId;
                    widget.consultation.question = updatedConsultation.question;
                    widget.consultation.createdAt =
                        updatedConsultation.createdAt;
                    widget.consultation.updatedAt =
                        updatedConsultation.updatedAt;
                    widget.consultation.specialty =
                        updatedConsultation.specialty;
                    widget.consultation.answers = updatedConsultation.answers;

                    (context as Element).markNeedsBuild();
                  }
                },
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_forward,
                  size: 9.vmin,
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: controller.isloading
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(3.vmin),
                      child: Column(
                        children: [
                          Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ConstColors.darkBlue,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.vmin)),
                            borderOnForeground: true,
                            color: Colors.white54,
                            child: ListTile(
                              title: Text(
                                'التخصص: ${widget.consultation.specialty?.name ?? '-'}\n'
                                'تاريخ الإضافة: ${widget.consultation.createdAt?.split("T").first ?? '-'}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                              subtitle: Text(
                                'السؤال: ${widget.consultation.question ?? '-'}',
                                style: TextStyle(color: ConstColors.darkBlue),
                              ),
                              trailing: CircleAvatar(
                                radius: 6.vmin,
                                backgroundColor: Colors.red,
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('تأكيد الحذف'),
                                        content:
                                            Text('هل أنت متأكد من حذف الموعد'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text('إلغاء'),
                                          ),
                                          GetBuilder<MyConsultationController>(
                                            builder: (controller) {
                                              return TextButton(
                                                onPressed: () async {
                                                  final success =
                                                      await controller
                                                          .deletemyconsultation(
                                                              widget
                                                                  .consultation
                                                                  .id!);
                                                  if (success) {
                                                    WidgetsBinding.instance
                                                        .addPostFrameCallback(
                                                            (_) {});
                                                  }
                                                },
                                                child: controller.isLoadingDel
                                                    ? SizedBox(
                                                        width: 18,
                                                        height: 18,
                                                        child:
                                                            CircularProgressIndicator(
                                                                strokeWidth: 2),
                                                      )
                                                    : Text(
                                                        'حذف',
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 7.vmin,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.vmin),
                          if (widget.consultation.answers != null &&
                              widget.consultation.answers!.isNotEmpty)
                            ...widget.consultation.answers!.map((answer) {
                              return Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: ConstColors.darkBlue,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(5.vmin),
                                ),
                                color: Colors.white54,
                                child: ListTile(
                                  title: Text(
                                    "الدكتور: ${answer?.doctorFullName ?? '-'}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "${answer?.answerText ?? ''}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              );
                            }).toList()
                          else
                            Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: ConstColors.darkBlue,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.vmin),
                              ),
                              color: Colors.white54,
                              child: ListTile(
                                title: Text(
                                  "لا يوجد إجابة",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.sp,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

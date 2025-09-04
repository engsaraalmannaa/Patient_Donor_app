import 'package:Pationt_Donor/core/const/api_const.dart';
import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/pop_up.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/my_donations_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/edit_donate_screen.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThisDonationDetails extends StatefulWidget {
  final int donationid;
  final Data model;

  const ThisDonationDetails({
    super.key,
    required this.donationid,
    required this.model, //this.model1,
  });

  static const name = '/donationdetails';
  static final page = GetPage(
      name: name,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ThisDonationDetails(
          donationid: args["donationid"],
          model: args["model"]!,
        );
      });

  @override
  State<ThisDonationDetails> createState() => ThisDonationDetailsState();
}

class ThisDonationDetailsState extends State<ThisDonationDetails> {
  //String? replyText;
  @override
  void initState() {
    super.initState();
    // String? savedReply =
    //     CacheHelper.get<String>('amount_reply${controller.amount}');
    // if (savedReply != null) {
    //   replyText = savedReply;
    // }
  }

//Data1? data;
  //bool loading = true;
  final GlobalKey<FormState> key = GlobalKey();
  final HomeControllerd homeController = Get.find<HomeControllerd>();

  final MyDonationsController controller = Get.put(MyDonationsController());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        GetBuilder<MyDonationsController>(
            //init: MyDonationsController(),
            builder: (controller) {
          return controller.isloadingd
              ? Center(child: CircularProgressIndicator())
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    shape: Border.all(),
                    leading: Padding(
                      padding: EdgeInsets.only(right: 4.vmin),
                      child: Image.asset(
                        "assets/images/logoo.png",
                        width: 25.vmin,
                      ),
                    ),
                    title: Text(
                      "تفاصيل التبرع",
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
                          color: controller.data1?.data?.status == "pending"
                              ? Colors.white
                              : Colors.grey,
                        ),
                        onPressed: () async {
                          if (controller.data1?.data?.status == "pending") {
                            final result = await Get.to(() => EditDonateScreen(
                                  donationid: widget.donationid,
                                ));
                          } else {
                            showSnackBar(
                                "عذرا.. لا يمكنك التعديل نظرا لقبول تبرعك");
                          }

                          // if (result != null && result?['refresh'] == true) {
                          //   Consultation updatedConsultation = result['consultation'];

                          //   // حدث الكائن الأصلي (consultation) بالبيانات الجديدة:
                          //   widget.consultation.id = updatedConsultation.id;
                          //   widget.consultation.specialtyId =
                          //       updatedConsultation.specialtyId;
                          //   widget.consultation.patientId =
                          //       updatedConsultation.patientId;
                          //   widget.consultation.question = updatedConsultation.question;
                          //   widget.consultation.createdAt =
                          //       updatedConsultation.createdAt;
                          //   widget.consultation.updatedAt =
                          //       updatedConsultation.updatedAt;
                          //   widget.consultation.specialty =
                          //       updatedConsultation.specialty;
                          //   widget.consultation.answers = updatedConsultation.answers;

                          //   // حدث الواجهة:
                          //   (context as Element).markNeedsBuild();
                          // }
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
                  body: Form(
                    key: key,
                    child: SafeArea(
                      child: controller.isloadingd
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
                                          borderRadius:
                                              BorderRadius.circular(5.vmin)),
                                      borderOnForeground: true,
                                      color: Colors.white54,
                                      child: ListTile(
                                        title: Center(
                                          child: FutureBuilder<int>(
                                              future: homeController
                                                  .gePersistentRandomNumber(
                                                      widget!.model!.disease!
                                                          .patientId!),
                                              builder: (context, snapshot) {
                                                return Column(
                                                  children: [
                                                    Text(
                                                      'شكرا للتبرع',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.sp,
                                                          color: Colors
                                                              .indigoAccent),
                                                    ),
                                                    Text(
                                                      'المريض:${snapshot.data} ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18.sp,
                                                          color: Colors
                                                              .indigoAccent),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(""
                                                  'حالة الطلب: ${controller.data1?.data?.status != null ? "في الانتظار  " : " جديد" ?? '-'}\n'
                                                  'اكتمال الحالة: ${controller.data1?.data?.disease!.donationStatus != null ? "لم تكتمل بعد" : " جديد" ?? '-'}\n'
                                                  'درجة الخطورة : ${controller.data1?.data?.disease?.urgencyLevel ?? "-"}\n'
                                                  'حالة المريض: ${controller.data1?.data?.disease?.patientStatus ?? '-'}\n'
                                                  'المبلغ المتاح: ${controller.data1?.data?.disease?.availableMoney ?? '-'}\n'
                                                  'المبلغ المطلوب: ${controller.data1?.data?.disease?.neededAmount ?? '-'}\n'
                                                  'المبلغ المجمع: ${controller.data1?.data?.disease?.collectedAmount ?? '-'}\n'
                                                  'الوقت النهائي: ${controller.data1?.data?.disease?.finalTime ?? '-'}\n'
                                                  'أنشئ في: ${controller.data1?.data?.createdAt?.split("T").first ?? '-'}'),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Center(
                                              child: Column(
                                                children: [
                                                  Text("صورة الوصل"),
                                                  if (controller
                                                          .data1?.data?.image !=
                                                      null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.vmin),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    3.vmin),
                                                        child:controller.isloadingd
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Image.network(
                                                          "${ApiConst.baseUrl}/storage/${controller.data1!.data!.image}",
                                                          height: 50.vmin,
                                                          width: 60.vmin,
                                                          fit: BoxFit.fill,
                                                          
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return Icon(
                                                              Icons
                                                                  .broken_image,
                                                              size: 20.vmin,
                                                              color:
                                                                  Colors.grey,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),

                                        //           trailing: CircleAvatar(
                                        //             radius: 6.vmin,
                                        //             backgroundColor: Colors.red,
                                        //             child: IconButton(
                                        //               onPressed: () {
                                        //                 showDialog(
                                        //                   context: context,
                                        //                   builder: (context) => AlertDialog(
                                        //                     title: Text('تأكيد الحذف'),
                                        //                     content: Text('هل أنت متأكد من حذف الموعد'),
                                        //                     actions: [
                                        //                       TextButton(
                                        //                         onPressed: () =>
                                        //                             Navigator.of(context).pop(), // إلغاء
                                        //                         child: Text('إلغاء'),
                                        //                       ),
                                        //                       GetBuilder<MyDonationsController>(
                                        //                         builder: (controller) {
                                        //                           return TextButton(
                                        //                             onPressed: controller.isLoadingDel
                                        //                                 ? null
                                        //                                 : () async {
                                        //                                     final success =
                                        //                                         await controller
                                        //                                             .deletemyconsultation(
                                        //                                                 widget
                                        //                                                     .consultation
                                        //                                                     .id!);
                                        //                                     if (success) {
                                        //                                       Navigator.of(context).pop();
                                        //                                       Get.offAllNamed(
                                        //                                           ShowMyConsultation
                                        //                                               .name);
                                        //                                     } else{
                                        //   // ممكن تعرض رسالة خطأ هنا
                                        //   ScaffoldMessenger.of(context).showSnackBar(
                                        //     SnackBar(content: Text('حدث خطأ أثناء الحذف')),
                                        //   );
                                        // }
                                        //                                   },
                                        //                             child: controller.isLoadingDel
                                        //                                 ? SizedBox(
                                        //                                     width: 18,
                                        //                                     height: 18,
                                        //                                     child:
                                        //                                         CircularProgressIndicator(
                                        //                                             strokeWidth: 2),
                                        //                                   )
                                        //                                 : Text(
                                        //                                     'حذف',
                                        //                                     style: TextStyle(
                                        //                                         color: Colors.red),
                                        //                                   ),
                                        //                           );
                                        //                         },
                                        //                       ),
                                        //                     ],
                                        //                   ),
                                        //                 );
                                        //               },
                                        //               icon: Icon(
                                        //                 Icons.delete,
                                        //                 color: Colors.white,
                                        //                 size: 7.vmin,
                                        //               ),
                                        //             ),
                                        //           ),
                                      ),
                                    ),
                                    SizedBox(height: 10.vmin),
                                    // AppButton(
                                    //     text: "تفاصيل التبرع ",
                                    //     ontap: () {
                                    //       showDialog(
                                    //         context: context,
                                    //         builder: (context) => AlertDialog(
                                    //           title: Text('تفاصيل التبرع '),
                                    //           content: Text(
                                    //               'هل أنت متأكد من التبرع'),
                                    //           actions: [
                                    //             TextButton(
                                    //               onPressed: () =>
                                    //                   Navigator.of(context)
                                    //                       .pop(), // إلغاء
                                    //               child: Text('إلغاء'),
                                    //             ),

                                    //             TextButton(
                                    //               onPressed: () {
                                    //                 showDialog(
                                    //                   context: context,
                                    //                   builder: (context) =>
                                    //                       AlertDialog(
                                    //                     title: Text(
                                    //                         'تأكيد التبرع'),
                                    //                     content: Container(
                                    //                       height: 110.vmin,
                                    //                       child: Column(
                                    //                         children: [
                                    //                           Text(
                                    //                               " شكرا لك ، \n من فضلك قم بالتبرع لاحدى الحسابات التالية \n "),
                                    //                           Directionality(
                                    //                             textDirection:
                                    //                                 TextDirection
                                    //                                     .ltr,
                                    //                             child: Column(
                                    //                               mainAxisAlignment:
                                    //                                   MainAxisAlignment
                                    //                                       .end,
                                    //                               children: [
                                    //                                 Text(
                                    //                                   " بنك البركة   ",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           12.spa),
                                    //                                 ),
                                    //                                 SelectableText(
                                    //                                   "5324137 رقم الحساب \n",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           11.spa),
                                    //                                 ),
                                    //                                 Text(
                                    //                                   " البنك الاسلامي   ",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           12.spa),
                                    //                                 ),
                                    //                                 SelectableText(
                                    //                                   "5121688   رقم الحساب \n ",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           11.spa),
                                    //                                 ),
                                    //                                 Text(
                                    //                                   " شركة الهرم للحوالات المالية   ",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           12.spa),
                                    //                                 ),
                                    //                                 SelectableText(
                                    //                                   " 0955555555   رقم الهاتف   \n",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           11.spa),
                                    //                                 ),
                                    //                                 Text(
                                    //                                   " شركة الفؤاد للحوالات المالية   ",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           12.spa),
                                    //                                 ),
                                    //                                 SelectableText(
                                    //                                   "0988888888     رقم الهاتف   \n",
                                    //                                   style: TextStyle(
                                    //                                       fontSize:
                                    //                                           11.spa),
                                    //                                 ),
                                    //                               ],
                                    //                             ),
                                    //                           ),
                                    //                         ],
                                    //                       ),
                                    //                     ),
                                    //                     actions: [

                                    //                       TextButton(
                                    //                         onPressed: () {

                                    //                           final controller =
                                    //                               Get.find<
                                    //                                   MyDonationsController>();
                                    //                           controller
                                    //                                   .idConsltation =
                                    //                               widget.model
                                    //                                   .id!;
                                    //                           controller
                                    //                               .showDiseases();
                                    //                           Get.toNamed(
                                    //                             DonateScreen
                                    //                                 .name,
                                    //                             arguments:
                                    //                                 widget.model
                                    //                                     .id,
                                    //                           );
                                    //                           print(
                                    //                               '${widget.model.id}');
                                    //                         },

                                    //                         child: Text(
                                    //                           'تم',
                                    //                           style: TextStyle(
                                    //                               color: Colors
                                    //                                   .red),
                                    //                         ),
                                    //                       ),

                                    //                     ],
                                    //                   ),
                                    //                 );
                                    //               },
                                    //               child: Text(
                                    //                 'التالي',
                                    //                 style: TextStyle(
                                    //                     color: Colors.red),
                                    //               ),
                                    //             ),

                                    //           ],
                                    //         ),
                                    //       );
                                    //     }),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ),
                );
        }),
      ],
    );
  }
}

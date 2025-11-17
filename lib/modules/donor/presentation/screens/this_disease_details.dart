import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/core/core_components/app_button.dart';
import 'package:Pationt_Donor/core/core_components/app_text_form_field.dart';
import 'package:Pationt_Donor/core/core_components/wallpaper.dart';
import 'package:Pationt_Donor/core/storage/shared_preferences.dart';
import 'package:Pationt_Donor/modules/donor/data/model/disease_model.dart';
//import 'package:Pationt_Donor/modules/donor/data/model/show_disease_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/donate_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThisDiseaseDetails extends StatefulWidget {
  final int diseaseId;
  final Data model;

  const ThisDiseaseDetails({
    super.key,
    required this.diseaseId,
    required this.model, 
  });

  static const name = '/diseasedetails';
  static final page = GetPage(
      name: name,
      page: () {
        final args = Get.arguments as Map<String, dynamic>;
        return ThisDiseaseDetails(
          diseaseId: args["diseaseId"],
          model: args["model"]!,
        );
      });

  @override
  State<ThisDiseaseDetails> createState() => ThisDiseaseDetailsState();
}

class ThisDiseaseDetailsState extends State<ThisDiseaseDetails> {
  String? replyText;
  @override
  void initState() {
    super.initState();
    String? savedReply =
        CacheHelper.get<String>('amount_reply${controller.amount}');
    if (savedReply != null) {
      replyText = savedReply;
    }
  }


  final GlobalKey<FormState> key = GlobalKey();

  final HomeControllerd controller = Get.put(HomeControllerd());

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(
          num: 0.3,
          image: "assets/images/pattern.png",
        ),
        GetBuilder<HomeControllerd>(
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
                      "تفاصيل الحالة",
                      style: TextStyle(
                        fontSize: 12.5.spa,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    centerTitle: true,
                    actions: [
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
                                          borderRadius:
                                              BorderRadius.circular(5.vmin)),
                                      borderOnForeground: true,
                                      color: Colors.white54,
                                      child: ListTile(
                                        title: FutureBuilder<int>(
                                            future: controller
                                                .gePersistentRandomNumber(
                                                    widget.model.patientId!),
                                            builder: (context, snapshot) {
                                              return Text(
                                                'المريض: ${snapshot.data ?? '-'}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.sp,
                                                    color: Colors.indigoAccent),
                                              );
                                            }),
                                        subtitle: Text(""
                                            'الحالة: ${controller.data1?.data?.patientStatus ?? '-'}\n'
                                            'درجة الخطورة : ${controller.data1?.data?.urgencyLevel ?? "-"}\n'
                                            'المبلغ المتاح: ${controller.data1?.data?.availableMoney ?? '-'}\n'
                                            'المبلغ المطلوب: ${controller.data1?.data?.neededAmount ?? '-'}\n'
                                            'المبلغ المجمع: ${controller.data1?.data?.collectedAmount ?? '-'}\n'
                                            'الوقت النهائي: ${controller.data1?.data?.finalTime ?? '-'}\n'
                                            'حالة التبرع: ${controller.data1?.data?.donationStatus != null ? "في الانتظار " : "" ?? '-'}\n'
                                            'تاريخ الإضافة: ${controller.data1?.data?.createdAt?.split("T").first ?? '-'}'),
                                      ),
                                    ),
                                    SizedBox(height: 10.vmin),
                                    AppButton(
                                        text: "تفاصيل التبرع ",
                                        ontap: () {
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text('تفاصيل التبرع '),
                                              content: Text(
                                                  'هل أنت متأكد من التبرع'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(), 
                                                  child: Text('إلغاء'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          Container(
                                                        height: 150,
                                                        child: AlertDialog(
                                                          title: Text(
                                                              'تأكيد التبرع'),
                                                          content: Column(
                                                            children: [
                                                              Text(
                                                                  " شكرا لك ، \n من فضلك قم بالتبرع لاحدى الحسابات التالية \n "),
                                                              Directionality(
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Text(
                                                                      " بنك البركة   ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12.spa),
                                                                    ),
                                                                    SelectableText(
                                                                      "5324137 رقم الحساب \n",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11.spa),
                                                                    ),
                                                                    Text(
                                                                      " البنك الاسلامي   ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12.spa),
                                                                    ),
                                                                    SelectableText(
                                                                      "5121688   رقم الحساب \n ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11.spa),
                                                                    ),
                                                                    Text(
                                                                      " شركة الهرم للحوالات المالية   ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12.spa),
                                                                    ),
                                                                    SelectableText(
                                                                      " 0955555555   رقم الهاتف   \n",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11.spa),
                                                                    ),
                                                                    Text(
                                                                      " شركة الفؤاد للحوالات المالية   ",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              12.spa),
                                                                    ),
                                                                    SelectableText(
                                                                      "0988888888     رقم الهاتف   \n",
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              11.spa),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                final controller =
                                                                    Get.find<
                                                                        HomeControllerd>();
                                                                controller
                                                                        .idConsltation =
                                                                    widget.model
                                                                        .id!;
                                                                controller
                                                                    .showDiseases();
                                                                Get.toNamed(
                                                                  DonateScreen
                                                                      .name,
                                                                  arguments:
                                                                      widget
                                                                          .model
                                                                          .id,
                                                                );
                                                                print(
                                                                    '${widget.model.id}');
                                                              },
                                                              child: Text(
                                                                'تم',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text(
                                                    'التالي',
                                                    style: TextStyle(
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
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

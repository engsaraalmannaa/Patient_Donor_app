import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/my_donations_controller.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/this_donation_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/patient/data/model/consultation_model.dart';
import '../../modules/patient/presentation/controllers/home_controller.dart';
import '../const/const_colors.dart';

class Container2 extends StatefulWidget {
   const Container2({super.key,
 
   required this.model,
    required this.index});

  final Data model;
  final int index;

  @override
  State<Container2> createState() => _Container2State();
}

class _Container2State extends State<Container2> {
  MyDonationsController controller = Get.find<MyDonationsController>();
  
final homeController = Get.find<HomeControllerd>();


  @override
  Widget build(BuildContext context) {
    final caseData = widget.model;

      final patientNumber = homeController.gePersistentRandomNumber(
        widget.model!.disease!.patientId!);

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
           
                title: FutureBuilder<int>(
                  future: homeController.gePersistentRandomNumber(
      widget.model.disease!.patientId!),
                  builder: (context,snapshot) {
                    return Text(
                       'المريض: ${snapshot.data ?? "-"}',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.indigo),
                    );
                  }
                ),
                subtitle: Text(
                                        caseData == null ? '-' : buildCaseSubtitle(caseData),

                      maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                trailing:SizedBox(
                  
                  width: 25.vmin,
                  child: Center(
                    child: InkWell(
                        child: CircleAvatar(
                            backgroundColor: ConstColors.darkBlue,
                            child: IconButton(
                                onPressed: () {
                                  final controller = Get.find<MyDonationsController>();
                                  controller.donationid = widget.model.id!;
                                  controller.showdonation();
                                  Get.toNamed(
                                    ThisDonationDetails.name,
                                    arguments: {
     "donationid": controller.donationid,
    "model": widget.model,
  },
                                  );
                                },
                                icon: Icon(Icons.remove_red_eye,
                                    color: Colors.white)))),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

String translateDonationStatus(String? status) {
  switch (status) {
    case "accepted":
      return "مقبول";
    case "rejected":
      return "مرفوض";
    case "pending":
      return "قيد الانتظار";
    default:
      return "-";
  }
}

String buildCaseSubtitle(Data d,) {
  
  final lines = <String>[
    
    'حالة المريض: ${d.disease!.patientStatus ??'-'} ',
    'حالة التبرع: ${translateDonationStatus(d.status) ??'-'} ',
    'المبلغ المتبرع به : ${d.amount ?? '-'} ',
    'درجة الخطورة: ${d.disease!.urgencyLevel != null ? "عالية" : ""?? '-'} ',
    
   ];

  return lines.join('\n');
  
}
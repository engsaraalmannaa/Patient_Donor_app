import 'package:Pationt_Donor/modules/patient/data/model/show_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_consultations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/patient/data/model/consultation_model.dart';
import '../../modules/patient/presentation/controllers/home_controller.dart';
import '../const/const_colors.dart';

class Container1 extends StatefulWidget {
  const Container1({super.key, required this.model, required this.index, this.data1});

  final ConsultationModel model;
  final int index;
   final ShowConsultationModel? data1;


  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  final controller = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
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
                  "رقم المريض:${widget.model.patient?.userId.toString() ?? "-"}",
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.indigo, fontSize: 12.spa),
                ),
                subtitle: Text(
                  // "رقم المريض: ${widget.model.meetStatus ?? '-'}\n"
                  "التخصص: ${widget.model.specialty?.name ?? '-'}\n"
                  "السؤال: ${widget.model.question ?? '-'}",
      
                  // "الكلفة: ${widget.model.meetCost!.toString()} ل.س ",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                trailing: Column(
                  mainAxisSize:MainAxisSize.min,
                  children: [
                    InkWell(
                      child: CircleAvatar(
                       
                        backgroundColor: ConstColors.darkBlue,
                        child: IconButton(onPressed: (){
                          final controller = Get.find<HomeController>();
                            controller.idConsltation = widget.model.id!;
                            controller.showConsultations();
                          Get.toNamed(
                            ShowConsultations.name,
                            arguments: widget.model.id,
                          );
                          
                        }, icon: Icon(Icons.remove_red_eye,color: Colors.white,))
                      )
                    ),
                    SizedBox(height: 1.h,),
                  //                     Text(
                  //   (controller.data1!.answers != null &&
                  //           controller.data1!.answers.isNotEmpty)
                  //       ? "تم الرد"
                  //       : "لم يتم الرد بعد",
                  //   style: TextStyle(
                  //     color: (controller.data1!.answers != null &&
                  //             controller.data1!.answers.isNotEmpty)
                  //         ? Colors.green
                  //         : Colors.red,
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),

                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

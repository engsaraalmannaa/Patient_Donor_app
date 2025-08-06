import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/patient/data/model/consultation_model.dart';
import '../../modules/patient/presentation/controllers/home_controller.dart';
import '../const/const_colors.dart';

class Container1 extends StatelessWidget {
  const Container1({super.key,
  
   required this.model,
    required this.index});

  final ConsultationModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: 1.vmin, left: 5.vmin, top: 1.vmin, bottom: 1.vmin),
      child: InkWell(
        onTap: () {
          final controller = Get.find<HomeController>();
          controller.idConsltation = controller.data![index].id.toString();

          Get.to(() => {
            
          } //Consultation(model: model,)
              );
          //DetailsScreen(text: fullText,));
          // Action
        },
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
                    " رقم المريض:${model.patient?.userId.toString() ?? "-"}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo,
                    fontSize: 12.spa),
                  ),
                  subtitle: Text(
                  // "رقم المريض: ${widget.model.meetStatus ?? '-'}\n"
                  " التخصص: ${model.specialty?.name ?? '-'}\n"
                  "السؤال: ${model.question ?? '-'}\n",
                 
                  // "الكلفة: ${widget.model.meetCost!.toString()} ل.س ",
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                  // trailing: CircleAvatar(
                  //   backgroundColor: Colors.white54,
                  //   radius: 5.5.vmin,
                  //   child: Icon(
                  //     Icons.person,
                  //     color: Colors.indigo,
                  //   ),
                  // ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

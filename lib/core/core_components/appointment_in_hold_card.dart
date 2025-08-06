import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/patient/data/model/appointment_in_hold_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/appointment_in_hold_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppointmentInHoldCard extends StatefulWidget {
  const AppointmentInHoldCard({
    super.key,
    required this.model,
    required this.index,

    //  required this.model,
    //   required this.index
  });

  final Data model;
  final int index;

  @override
  State<AppointmentInHoldCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentInHoldCard> {
  final controller = Get.find<AppointmentInHoldController>();
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
                    "${widget.model.specialtyId.toString() ?? ''}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  subtitle: Text(
                    
                      " اليوم: ${widget.model.specialtyId ?? '-'}\n"
                      // "الوقت: ${widget.model.workTime ?? '-'}\n"
                      // "الحالة: ${widget.model.meetStatus ?? '-'}\n"
                      // "الكلفة: ${widget.model.meetCost!.toString()} ل.س "
                      ,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  
                ),
               
              
                
            
              ],
            ),
           
          ),
        ));
  }
}

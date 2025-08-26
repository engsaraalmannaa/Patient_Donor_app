

import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/patient/data/model/my_consultation_model.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/appointment_in_hold_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/controllers/my_consultation_controller.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/consultation_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyConsultationsCard extends StatefulWidget {
  const MyConsultationsCard({
    super.key,
    required this.model,
    required this.index,

    //  required this.model,
    //   required this.index
  });

  final Consultation model;
  final int index;

  @override
  State<MyConsultationsCard> createState() => MyConsultationsCardState();
}

class MyConsultationsCardState extends State<MyConsultationsCard> {
  final controller = Get.find<MyConsultationController>();
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
                    "${widget.model.specialty?.name ?? ''}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  subtitle: Text(
                    //" اسم الطبيب: ${widget.model.doctor?.firstName ?? '-'} ${widget.model.doctor?.lastName ?? '-'}\n"
                    "تاريخ الإضافة: ${widget.model.createdAt?.split("T").first}\n"
                    
                    "السؤال:  ${widget.model.question ?? '-'} ",
                    //"الحالة: ${widget.model.patient?.status == 'pending' ? 'في الانتظار' : '-'}\n"
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),

                  trailing: InkWell(
                    child: CircleAvatar(
                      backgroundColor: ConstColors.darkBlue,
                      child: IconButton(onPressed: (){
                        Get.toNamed(
  ConsultationDetailsScreen.name,
  arguments: widget.model,
);

                      }, icon: Icon(Icons.remove_red_eye,color: Colors.white))
                    )
                  ),
//                   trailing: CircleAvatar(
//                     backgroundColor: Colors.red,
//                     child: IconButton(
//                       onPressed: () {
//                         showDialog(
//   context: context,
//   builder: (context) => AlertDialog(
//     title: Text('تأكيد الحذف'),
//     content: Text('هل أنت متأكد من حذف الموعد'),
//     actions: [
//       TextButton(
//         onPressed: () => Navigator.of(context).pop(), // إلغاء
//         child: Text('إلغاء'),
//       ),

//       GetBuilder<AppointmentInHoldController>(
//         builder: (_) {
//           return TextButton(
//             onPressed: controller.isLoadingDel
//                 ? null
//                 : () async {
//                     await controller.deleteappointmentrequist(widget.model.id!);
//                     Navigator.of(context).pop();
//                   },
//             child: controller.isLoadingDel
//                 ? SizedBox(
//                     width: 18,
//                     height: 18,
//                     child: CircularProgressIndicator(strokeWidth: 2),
//                   )
//                 : Text(
//                     'حذف',
//                     style: TextStyle(color: Colors.red),
//                   ),
//           );
//         },
//         ),
//       // TextButton(
//       //   onPressed: () {
//       //     controller.deleteappointmentrequist(widget.model.id!); // تنفيذ الحذف
//       //     Navigator.of(context).pop(); // إغلاق الحوار
//       //   },
//       //   child: Text(
//       //     'حذف',
//       //     style: TextStyle(color: Colors.red),
//       //   ),
//       // ),
//     ],
//   ),
// );

//                       },
//                       icon: Icon(Icons.delete, color: Colors.white),
//                     ),
//                   ),
                ),
              ],
            ),
          ),
        ));
  }
}

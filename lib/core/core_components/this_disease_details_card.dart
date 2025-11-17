import 'package:Pationt_Donor/core/const/const_colors.dart';
import 'package:Pationt_Donor/modules/donor/data/model/show_disease_model.dart';
import 'package:Pationt_Donor/modules/donor/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThisDiseaseDetailsCard extends StatefulWidget {
  const ThisDiseaseDetailsCard({
    super.key,
    required this.model,
    required this.index,
  });

  final Data1 model;
  final int index;

  @override
  State<ThisDiseaseDetailsCard> createState() => ThisDiseaseDetailsCardState();
}

class ThisDiseaseDetailsCardState extends State<ThisDiseaseDetailsCard> {
  final controller = Get.find<HomeControllerd>();
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
                    "${widget.model.availableMoney ?? ''}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.indigo),
                  ),
                  subtitle: Text(
                    "تاريخ الإضافة: ${widget.model.createdAt?.split("T").first}\n"
                    "السؤال:  ${widget.model.availableMoney ?? '-'} ",
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
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye,
                                  color: Colors.white)))),
                ),
              ],
            ),
          ),
        ));
  }
}

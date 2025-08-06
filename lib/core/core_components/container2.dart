import 'package:Pationt_Donor/modules/donor/data/model/donation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../modules/patient/data/model/consultation_model.dart';
import '../../modules/patient/presentation/controllers/home_controller.dart';
import '../const/const_colors.dart';

class Container2 extends StatelessWidget {
  const Container2({super.key,
  required this.ontap,
   required this.model,
    required this.index});
final VoidCallback ontap;
  final DonationModel model;
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

          Get.to(() => {} //Consultation(model: model,)
              );
          //DetailsScreen(text: fullText,));
          // Action
        },
        child: InkWell(
          onTap: ontap,
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
                      model.data?.toString() ?? "",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(color: Colors.indigo),
                    ),
                    subtitle: Text(
                      model.data.toString() ?? "",
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
                      child: Icon(
                        Icons.person,
                        color: Colors.indigo,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

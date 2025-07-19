import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:Pationt_Donor/modules/donor/presentation/screens/details.dart';

import '../const/const_colors.dart';

class CasesCard extends StatelessWidget {
  final String fullText; // النص الكامل
  //final VoidCallback onViewDetails; // ما يحدث عند الضغط على الزر

  const CasesCard({super.key,
    required this.fullText,
    //required this.onViewDetails
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
          right: 1.vmin,
          left: 5.vmin,
          top: 1.vmin,
          bottom: 1.vmin
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: ConstColors.darkBlue,
              width: 0.5,
            )
            ,borderRadius: BorderRadius.circular(5.vmin)
        ),
        borderOnForeground:true,
        color: Colors.white54,
        child: Padding(
          padding: EdgeInsets.only(
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                leading:
                CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 5.5.vmin,
                  child: Icon(
                    Icons.person,
                    color:ConstColors.darkBlue ,),
                ),
                title: Text("5127633",
                  style:
                  TextStyle(color:ConstColors.darkBlue)
                  ,),
                subtitle: Text(
                  fullText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                  ),
                ),
                trailing:
                InkWell(
                  onTap: () {
                    Get.to(() => DetailsScreen(text: fullText,));
                    // Action
                  },
                  child:
                  CircleAvatar(
                  backgroundColor: Colors.white54,
                  radius: 5.5.vmin,
                  child: Icon(
                    Icons.visibility,
                    color: ConstColors.darkBlue,
                  ),
                )

              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

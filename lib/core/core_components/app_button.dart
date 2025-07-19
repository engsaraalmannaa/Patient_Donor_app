import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../const/const_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, required this.ontap, this.width});

  final String text;
  final VoidCallback ontap;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(text,style: TextStyle(
            fontSize: 14.spa,
            fontWeight: FontWeight.w600,
            color: Colors.white
          )),
        ),
        width: width ?? 45.vmin,
        height: 15.vmin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.vmin),
          border: Border.all(),
          color: ConstColors.darkBlue,
        ),
      ),
    );
  }
}

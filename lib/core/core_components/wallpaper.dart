import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wallpaper extends StatelessWidget {
  const Wallpaper({super.key,
    required this.image,
    required this.num})
  ;
    final String image;
    final double num;
  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white12
              , Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Opacity(
          opacity: num,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                    //    "assets/images/pattern.png"
                   image ),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}

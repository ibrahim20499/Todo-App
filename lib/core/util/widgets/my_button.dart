import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double height;
  final double radius;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onpressed;
  final double fontsize;
  const MyButton(
      {Key? key,
        required this.text,
        this.height = 60.0,
        required this.radius,
        required this.textColor,
        required this.buttonColor, required this.onpressed, required this.fontsize,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //padding: EdgeInsets.symmetric(vertical: 25),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        height: height,
        onPressed: onpressed,
        child: Text(
          text,

          style: TextStyle(
              fontSize: fontsize, color: textColor, fontWeight: FontWeight.bold),
        ),
        color: buttonColor,
      ),
    );
  }
}


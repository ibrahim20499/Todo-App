import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  final String text;
  final TextInputType? type;

  //final String hintText;
  final double? height;
  final String? hint;
  final double? width;
  final TextEditingController? controller;
  final IconData? suffix;
  final bool isSuffix = false;
  final VoidCallback? onpressed;
  void Function()? onTap;
  final Widget? widget;
  String? Function(String?)? validate;

  //final bool isPassword;
  //final String validator;
  MyForm({
    Key? key,
    this.widget,
    this.onTap,
     this.suffix,
     this.onpressed,
    required this.width,
     this.hint,
    required this.text,
     this.type,
    this.height = 60.0,
     this.controller,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: height,
          width: width,
          child: TextFormField(
            keyboardType: type,
            controller: controller,
            onTap: onTap,
            validator: validate,
            decoration: InputDecoration(
              fillColor: Colors.grey,

              hintText: hint,
              suffixIcon:Icon(suffix),
              hintStyle: TextStyle(
                  color: Colors.grey.shade500, fontWeight: FontWeight.w600),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              //fillColor: Color(0xfff3f3f4)
            ),
          ),
        )
      ],
    );
  }
}

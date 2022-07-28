import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String title;
  final String text;
  //final VoidCallback onpressed;
  final Widget widget;
  final double height;
  final double width;
  //final IconData icon;

  const InputField(
      {Key? key, required this.title, required this.text, this.height = 60, this.width = double
          .infinity, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              //color: Colors.black,
              style: BorderStyle.solid,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              widget,
            ],
          ),
        )
      ],
    );
  }
}

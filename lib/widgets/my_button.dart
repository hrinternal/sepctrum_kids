import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/color_box.dart';
import 'package:spectrum_kids/utility/text_style.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  MyButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 41.0,
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: ColorBox.primaryColor,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.h3style.copyWith(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spectrum_kids/utility/constant.dart';

class FruitTileCard extends StatelessWidget {
  final bool? isActive;
  final String? image;
  final String? fruitName;
  final Color? textColor;
  final Color? backgroundColor;
  final double? fontSizeBase;
  final double? fontSizeActive;
  final VoidCallback? onTap;

  const FruitTileCard({
    Key? key,
    this.isActive = false,
    this.image,
    this.fruitName,
    this.textColor = kTitleTextColor,
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 25,
    this.fontSizeActive = 30,
    this.onTap,
    title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.circular(15.0),
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            child: AnimatedDefaultTextStyle(
              style: isActive!
                  ? TextStyle(fontSize: fontSizeActive)
                  : TextStyle(fontSize: fontSizeBase),
              duration: const Duration(milliseconds: 400),
              curve: Curves.bounceOut,
              child: Column(
                children: [
                  Image.asset(image!, fit: BoxFit.cover),
                  Text(fruitName!,
                      softWrap: false,
                      style: TextStyle(
                        color: textColor,
                        fontFamily: 'CabinSketch',
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


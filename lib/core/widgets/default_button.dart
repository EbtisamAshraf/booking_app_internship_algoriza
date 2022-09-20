import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color background;
  final double height;
  final double width;
  final double radius;
  final VoidCallback onClick;
  final IconData? icon;
  final BuildContext? context;

  const DefaultButton({Key? key,
    required this.text,
    required this.onClick,
    this.textColor = Colors.white,
    this.background = AppColors.defaultColor,
    this.height = 45,
    this.width = 120,
    this.radius = 20,
    this.icon ,
    this.context,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          text,
          style: TextStyle(

            color: textColor,
          ),
        ),
      ),
    );
  }

}
// import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
Widget customElevatedButton(
    {required BuildContext context,
    double width = 1,
    required String text,
      final Color color = AppColors.defaultColor,
      final Color textColor =Colors.white,

    required VoidCallback? onPressed}) {
  return SizedBox(
    height: 52,
    width: MediaQuery.of(context).size.width * width,
    child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: color,
        child: TextButton(onPressed: onPressed, child: Text(text,style:  TextStyle(
          color:textColor,

        ),))),
  );
}



class CommonButton extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final String? buttonText;
  final Widget? buttonTextWidget;
  final Color? textColor, backgroundColor;
  final bool? isClickable;
  final double radius;
  const CommonButton({
    Key? key,
    this.onTap,
    this.buttonText,
    this.buttonTextWidget,
    this.textColor = Colors.white,
    this.backgroundColor,
    this.padding,
    this.isClickable = true,
    this.radius = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(),
      child: SizedBox(
        height: 48,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          color: backgroundColor ?? Theme.of(context).primaryColor,
          shadowColor: Colors.black12.withOpacity(
            Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
          ),
          child: Center(
            child: buttonTextWidget ??
                Text(
                  buttonText ?? "",
                  // style: TextStyles(context).getRegularStyle().copyWith(
                  //   color: textColor,
                  //   fontSize: 16,
                  // ),
                ),
          ),
        ),
      ),
    );
  }
}


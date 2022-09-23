import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CommonTextFieldView extends StatelessWidget {
  final String? titleText;
  final String hintText;
  final bool isAllowTopTitleView;
  final EdgeInsetsGeometry padding;
  final bool isPasswordVisible;
  final TextInputType keyboardType;
  final Widget? icon;
  final TextEditingController? controller;
  final String? errorText;

  const CommonTextFieldView({
    Key? key,
    this.hintText = '',
    this.isPasswordVisible = false,
    this.icon,
    this.padding = const EdgeInsets.only(),
    this.keyboardType = TextInputType.text,
    this.isAllowTopTitleView = true,
    this.titleText = '',
    this.controller,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAllowTopTitleView && titleText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                titleText ?? "",
                 style: TextStyle(color: AppColors.hintColor),
              ),
            ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadowColor: Colors.black12.withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.6 : 0.2,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                height: 48,
                child: Center(
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    // style: TextStyles(context).getRegularStyle(),
                    obscureText: isPasswordVisible,
                    cursorColor: Theme.of(context).primaryColor,
                    onEditingComplete: () {
                      FocusScope.of(context).nextFocus();
                    },
                    decoration: InputDecoration(
                      suffixIcon: icon,
                      errorText: null,
                      border: InputBorder.none,
                      hintText: hintText,
                      hintStyle:
                          TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    keyboardType: keyboardType,
                  ),
                ),
              ),
            ),
          ),
          if (errorText != null && errorText != '')
            Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
              child: Text(
                errorText ?? "",
                style: TextStyle(
                  color: AppColors.redErrorColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

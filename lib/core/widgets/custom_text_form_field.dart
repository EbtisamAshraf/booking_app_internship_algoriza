import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';

Widget customEmailTextFormField(
    {required BuildContext context, TextEditingController? emailController}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'your email',
        style: TextStyle(color: AppColors.hintColor),
      ),
      const SizedBox(height: 5,),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Container(
            height: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: Theme.of(context).textTheme.displaySmall,
              decoration: InputDecoration(
                hintText: 'enter your email',
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white)),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.white)),
              ),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'please enter your email address';
                } else {
                  return null;
                }
              },
            ),
          ),
        ),
      ),
    ],
  );
}

Widget customPasswordTextFormField(
    {required BuildContext context,
    TextEditingController? passwordController,
    required String text,
    required bool isPasswordVisible,
    required Widget icon}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text, style: Theme.of(context).textTheme.displayMedium),
      TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        style: Theme.of(context).textTheme.displaySmall,
        obscureText: !isPasswordVisible,
        decoration:
            InputDecoration(hintText: 'Enter your password', suffixIcon: icon),
        validator: (String? value) {
          if (value!.length <= 5 || value.isEmpty) {
            return 'password is too short';
          } else {
            return null;
          }
        },
      ),
    ],
  );
}

Widget customTextFormField(
    {required BuildContext context,
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? hint,
    String? validatorMassage,
    String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title!, style: Theme.of(context).textTheme.displayMedium),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: Theme.of(context).textTheme.displaySmall,
        decoration: InputDecoration(hintText: hint),
        validator: (String? value) {
          if (value!.isEmpty) {
            return validatorMassage;
          } else {
            return null;
          }
        },
      ),
    ],
  );
}

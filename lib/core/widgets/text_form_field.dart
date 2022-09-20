// import 'package:flutter/material.dart';
//
//
// class DefaultTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String text;
//   final IconData? prefix;
//   final IconData? suffix;
//   final TextInputType type;
//   final String validate;
//   final bool isPassword;
//   final VoidCallback? suffixPressed;
//   final VoidCallback? onSubmit;
//   final VoidCallback? onTap;
//   final VoidCallback? onChange;
//   final int? maxLength;
//   final bool isClickable;
//
//   const DefaultTextField({Key? key,
//     required this.text,
//     required this.controller,
//     required  this.validate,
//     required  this.type,
//     this.prefix,
//     this.suffix,
//     this.suffixPressed,
//     this.onTap,
//     this.onChange,
//     this.onSubmit,
//     this.isPassword=false,
//     this.isClickable=true,
//     this.maxLength,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       maxLength: maxLength,
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       onFieldSubmitted: (s) {
//         onSubmit!();
//       },
//       // onChanged: (value) {
//       //   onChange!();
//       // },
//       validator:(String? value){
//         if(value!.isEmpty){
//           return validate;
//         }
//         return null;
//       },
//       onTap: onTap,
//       decoration: InputDecoration(
//         hintText: text,
//
//         prefixIcon: Icon(prefix,color:Colors.grey[500]),
//         suffixIcon: suffix != null
//             ? IconButton(
//             color:Colors.grey[500],
//             onPressed: () {
//               suffixPressed!();
//             },
//             icon: Icon(suffix))
//             : null,
//         filled: true,
//         fillColor:  Colors.grey[100],
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: const BorderSide(color: AppColor.lightgrey)),
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: AppColor.lightgrey),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
//
// }
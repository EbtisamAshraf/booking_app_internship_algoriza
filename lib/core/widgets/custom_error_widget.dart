import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.msg}) : super(key: key);
final  String msg;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(msg),
    );
  }
}

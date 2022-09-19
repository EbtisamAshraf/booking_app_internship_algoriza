

import 'package:flutter/material.dart';

Widget customElevatedButton( {required BuildContext context, double width = 1 ,required String text ,required VoidCallback?onPressed }){
  return SizedBox(
    width: MediaQuery.of(context).size.width * width,
    child: ElevatedButton(onPressed: onPressed, child:  Text(text)),
  );
}




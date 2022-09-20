import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSearchForm extends StatelessWidget {
  const CustomSearchForm({Key? key, required this.hint, this.textController}) : super(key: key);
  
  final String hint;
  final TextEditingController? textController;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Container(
      margin: EdgeInsets.only(right: height * 0.01),
          width: width * 0.1,
          height: height * 0.08,
          decoration: BoxDecoration(borderRadius:const BorderRadius.all(Radius.circular(30),),
           boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 2,
        blurStyle: BlurStyle.normal,
      ),
    ],
          ),
          child: TextFormField(

            controller: textController,
            decoration: InputDecoration(

              hintText: hint,
              contentPadding:const EdgeInsets.fromLTRB(25, 25, 0, 25),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        );
  }
}
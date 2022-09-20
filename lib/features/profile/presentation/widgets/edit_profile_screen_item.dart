import 'package:flutter/material.dart';


class EditProfileOrSettingScreenItem extends StatelessWidget {
  const EditProfileOrSettingScreenItem({Key? key, this.onTap, required this.title, required this.info}) : super(key: key);
  final GestureTapCallback? onTap;
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: Theme.of(context).textTheme.displaySmall),
              Text(info,style: Theme.of(context).textTheme.displaySmall),

            ],),
        ),
        const SizedBox(height: 10,),
        Divider(
          color: Colors.grey.withOpacity(0.4),thickness: 1,
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
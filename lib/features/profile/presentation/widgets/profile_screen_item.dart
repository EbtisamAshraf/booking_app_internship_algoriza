import 'package:flutter/material.dart';

class ProfileOrSettingScreenItem extends StatelessWidget {
  const ProfileOrSettingScreenItem({Key? key, this.onTap, required this.text,  this.iconData, this.size, this.widget}) : super(key: key);
  final GestureTapCallback? onTap;
  final String text;
  final IconData? iconData;
  final Widget? widget;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,style: Theme.of(context).textTheme.displaySmall),
              iconData == null? widget! : Icon(iconData,color: Colors.grey,size:size  ,)
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
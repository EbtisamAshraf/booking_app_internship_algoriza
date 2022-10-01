import 'package:booking_app_internship_algoriza/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';


class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({Key? key,required this.image ,this.fit}) : super(key: key);
  final String image;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return image.isEmpty ?Image.asset(ImageAssets.person) :  FadeInImage.assetNetwork(
    placeholder:ImageAssets.loadingColour,
    image: image , fit: fit,);
  }
}
import 'package:booking_app_internship_algoriza/config/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HotelExploreItem extends StatelessWidget {
  const HotelExploreItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.3,
      width: width ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Card(
        child: Column(
          children: [
            Image.asset('assets/images/hotel.jpg',width: width,fit: BoxFit.fill),
            Row(
              children: [
                Text('Grand Royal Hotel',style: Theme.of(context).textTheme.bodyLarge,),
                Text("180", style: Theme.of(context).textTheme.bodyLarge,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

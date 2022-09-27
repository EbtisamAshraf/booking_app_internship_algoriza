import 'package:booking_app_internship_algoriza/config/themes/app_theme.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import '../../features/hotels/data/model/hotels_model.dart';
import '../../features/hotels/domain/use_cases/explore_use_cases.dart';
import '../../features/hotels/presentation/cubit/hotel_cubit.dart';

class HotelExploreItem extends StatelessWidget {
  const HotelExploreItem({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: EdgeInsets.all(height * 0.01),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.asset(
                  'assets/images/hotel.jpg',
                  width: width,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: EdgeInsets.all(height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Hotel Name',
                    //hotelDetails.name!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    '\$500',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: height * 0.01,
                  right: height * 0.01,
                  bottom: height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'location of hotel',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    "/per night",
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only( left: height * 0.05,
                  right: height * 0.01,
                  bottom: height * 0.02),
              child: RatingBarIndicator(
                rating: double
                    .parse('5'),
                itemBuilder:
                    (context,
                    index) =>
                const Icon(
                  Icons.star,
                  color: AppColors
                      .defaultColor,
                ),
                itemSize: 20.0,
                direction:
                Axis.horizontal,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       left: height * 0.05,
            //       right: height * 0.01,
            //       bottom: height * 0.02),
            //   child: RatingBarIndicator(
            //     rating: 4,
            //     itemBuilder: (context, index) => const Icon(
            //       Icons.star,
            //       color: AppColors.defaultColor,
            //     ),
            //     itemCount: 5,
            //     itemSize: 20.0,
            //     direction: Axis.horizontal,
            //   ),
            // ),
          ],
        ),
      ),
    );

  }
}

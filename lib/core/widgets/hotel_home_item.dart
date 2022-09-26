import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class HotelHomeItem extends StatelessWidget {
 const HotelHomeItem({Key? key, required this.dataHotels}) : super(key: key);

  // List<DataHotels>? dataHotels;
  final DataHotels dataHotels;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: height * 0.02),
      child: Container(
        height: height * 0.02,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black87,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
              child: Image.asset(
                'assets/images/Egypt.jpg',
                width: 120,
                height: 150,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    dataHotels.name.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    dataHotels.address.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.hintColor,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '2.0 km to city',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.hintColor,
                              ),
                            ),
                            SizedBox(width: width * 0.05,),
                            Text(
                              "EGP ${dataHotels.price.toString()}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        RatingBarIndicator(
                          rating: double.parse(dataHotels.rate.toString()),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.defaultColor,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

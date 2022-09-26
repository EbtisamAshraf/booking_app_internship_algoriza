import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';

class UpComingScreen extends StatelessWidget {
  const UpComingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(itemBuilder: (context,index)=>Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10),
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(15)),
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                  const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset(
                    'assets/images/hotel5.png',
                    width: 120,
                    height: 150,
                    fit: BoxFit.fitHeight,
                  ),
                  // CachedNetworkImage(
                  //   imageUrl:
                  //   'http://api.mahmoudtaha.com/images/${state.hotelsModel.data!.data![index].hotelImages!}',
                  //   width: 120,
                  //   height: 150,
                  //   placeholder: (context, url) =>
                  //   const Center(
                  //       child: CustomLoadingWidget()),
                  //   errorWidget: (context, url, error) =>
                  //       Image.asset(
                  //         'assets/images/hotel5.png',
                  //         width: 120,
                  //         height: 150,
                  //         fit: BoxFit.fitHeight,
                  //       ),
                  // ),

                  //     Image.asset(
                  //   'assets/images/hotel.jpg',
                  //   width: 120,
                  //   height: 150,
                  //   fit: BoxFit.fitHeight,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Text(
                          'Hotel Name',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'address',
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
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '2.0 km to city',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors
                                        .hintColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'EGP 200',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating:4,
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
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  ' 5  Rate',
                                  style: TextStyle(
                                      color: AppColors
                                          .hintColor),
                                )
                              ],
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
        ),
      ),
          separatorBuilder: (context,index)=>SizedBox(height: 5,),
          itemCount: 10),
    );
  }
}

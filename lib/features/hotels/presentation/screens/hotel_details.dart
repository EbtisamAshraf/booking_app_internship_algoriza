import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/core/widgets/default_button.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/facilities_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../domain/use_cases/explore_use_cases.dart';

class HotelDetailsScreen extends StatelessWidget {
  final DataHotels hotelDetails;
  // final FacilitiesData facilitiesData ;
  HotelDetailsScreen({required this.hotelDetails,
   // this.facilitiesData
  }
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      di.sl<HotelsCubit>()..getHotels(exploreHotel: ExploreHotel(page: 1)),
      child: BlocConsumer<HotelsCubit,HotelStates>(
        listener: (context,state){},
        builder: (context, state) => state is HotelsLoadingState
              ? const Center(child: CustomLoadingWidget())
                  : state is HotelsLoadedState ?
              Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(context.hight / 2.1),
                  child: Stack(
                    children: [
                      // CarouselSlider(
                      //   items: hotelDetails.hotelImages!
                      //       .map((e) => CachedNetworkImage(
                      //       imageUrl: e.image.toString(),width: double.infinity,
                      //     placeholder: (context, url) =>
                      //     const Center(child: CustomLoadingWidget()),
                      //     errorWidget: (context, url, error) => Icon(Icons.error),
                      //
                      //   ))
                      //       .toList(),
                      //   options: CarouselOptions(
                      //     height: context.hight / 1.7,
                      //     initialPage: 0,
                      //     reverse: false,
                      //     viewportFraction: 1.0,
                      //     autoPlayCurve: Curves.fastOutSlowIn,
                      //     autoPlay: true,
                      //     autoPlayAnimationDuration: const Duration(seconds: 1),
                      //     scrollDirection: Axis.horizontal,
                      //   ),
                      // ),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/images/hotel5.png',
                          height: context.hight / 2,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.black54,
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ))),
                            const Spacer(),
                            Container(
                              height: 50,
                              width: 55,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                children:  [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                  Expanded(child: Text(hotelDetails.rate!)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(hotelDetails.name!,style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),),
                        )
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:AppColors.hintColor.withOpacity(.1)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children:  [
                                        Icon(Icons.wifi,color: AppColors.hintColor,),
                                    const    SizedBox(
                                          width: 5,
                                        ),
                                        Text('Wifi',style: Theme.of(context).textTheme.bodySmall,)
                                      ],
                                    ));
                              },
                              separatorBuilder: (context, index) => const SizedBox(
                                width: 10,
                              ),
                              itemCount: hotelDetails.hotelFacilities!.length),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text('Description', style: Theme.of(context).textTheme.bodyLarge),
                        const SizedBox(
                          height: 10,
                        ),
                         Text(hotelDetails.description!,style: Theme.of(context).textTheme.bodySmall,),
                        const SizedBox(
                          height: 80,
                        ),
                        Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:AppColors.hintColor.withOpacity(.1)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBarIndicator(
                                  rating: double
                                      .parse(hotelDetails.rate!),
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
                                  height: 10,
                                ),
                                 Text('${hotelDetails.rate} Rate',style: TextStyle(color: AppColors.hintColor),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                persistentFooterButtons: [
                  DefaultButton(
                      width: double.infinity, radius: 5, text: 'Book Now', onClick: () {})
                ],
              ):
               const Center(child: CustomLoadingWidget()),

      ),
    );
  }
}

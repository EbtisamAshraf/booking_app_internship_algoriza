import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/core/widgets/sliver_header.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di.sl<HotelsCubit>()..getHotels(exploreHotel: ExploreHotel(page: 1)),
      child: Scaffold(
          backgroundColor: AppColors.backgroundColorLight,
          body: BlocConsumer<HotelsCubit, HotelStates>(
              listener: (context, state) {},
              builder: (context, state) => state is HotelsLoadingState
                  ? const Center(child: CustomLoadingWidget())
                  : state is HotelsLoadedState
                      ? CustomScrollView(
                          slivers: [
                            SliverPersistentHeader(
                                pinned: true,
                                floating: true,
                                delegate: SliverHeader(
                                    minExtension: 240,
                                    maxExtension: context.hight / 1.7)),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 10),
                                child: Row(
                                  children: [
                                    Text('Best Deals',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge),
                                    const Spacer(),
                                    TextButton(onPressed: (){}, child: Row(
                                      children: const [
                                        Text('View All',style: TextStyle(
                                            color: AppColors.defaultColor,
                                            fontWeight: FontWeight.bold),),
                                        Icon(Icons.arrow_forward,color: AppColors.defaultColor,)
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               HotelDetailsScreen(hotelDetails: state.hotelsModel.data!.data![index])));
                                },
                                child: Padding(
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
                                            child:
                                                CachedNetworkImage(
                                                  imageUrl:
                                                      'http://api.mahmoudtaha.com/images/${state.hotelsModel.data!.data![index].hotelImages!}',
                                                  width: 120,
                                                  height: 150,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child: CustomLoadingWidget()),
                                                  errorWidget: (context, url, error) =>
                                                      Image.asset(
                                                    'assets/images/hotel5.png',
                                                    width: 120,
                                                    height: 150,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),

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
                                                  state.hotelsModel.data!
                                                      .data![index].name!,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  state.hotelsModel.data!
                                                      .data![index].address!,
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
                                                            'EGP ${state.hotelsModel.data!.data![index].price}',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          RatingBarIndicator(
                                                            rating: double
                                                                .parse(state
                                                                    .hotelsModel
                                                                    .data!
                                                                    .data![
                                                                        index]
                                                                    .rate!),
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
                                                            ' ${state.hotelsModel.data!.data![index].rate!}  Rate',
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
                              );
                            },
                                    childCount:
                                        state.hotelsModel.data!.data!.length)),
                          ],
                        )
                      : const Center(child: CustomLoadingWidget()))),
    );
  }
}

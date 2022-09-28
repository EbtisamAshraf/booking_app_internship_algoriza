import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/core/widgets/sliver_header.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import 'dart:math' as math;
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      di.sl<HotelsCubit>()..getHotels(exploreHotel: ExploreHotel(page: 1)),
      child: Scaffold(
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
                          Text('Best Deals'.tr(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge),
                          const Spacer(),
                          TextButton(onPressed: (){}, child: Row(
                            children:  [
                              Text('View all'.tr(),style: const TextStyle(
                                  color: AppColors.defaultColor,
                                  fontWeight: FontWeight.bold),),
                              const Icon(Icons.arrow_forward,color: AppColors.defaultColor,)
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
                                            HotelDetailsScreen(hotelDetails: state.hotelsModel.data!.data![index]),
                                    ));
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
                                    shadowColor: const Color(0xFF6D6D6D).withOpacity(0.2),
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
                                            'http://api.mahmoudtaha.com/images/${state.hotelsModel.data!.data![index].hotelImages![math.Random().nextInt(state.hotelsModel.data!.data![index].hotelImages!.length)]}',
                                            width: 120,
                                            height: 150,
                                            fit: BoxFit.fitHeight,
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
                                        Expanded(
                                          child: Padding(
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
                                                    style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  state.hotelsModel.data!
                                                      .data![index].address!,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: AppColors.hintColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment
                                                      .start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Per night \\',
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
                                                          '${state.hotelsModel.data!.data![index].price}\$',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .headlineSmall,
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
                                              ],
                                            ),
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

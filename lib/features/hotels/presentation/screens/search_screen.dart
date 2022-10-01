import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'dart:math' as math;
import '../../domain/use_cases/search.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    HotelsCubit.get(context).getFacilities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelsCubit, HotelStates>(
      builder: (context, state) {
        if (state is FacilitiesLoadingState) {
          return Scaffold(body: CustomLoadingWidget());
        }
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (HotelsCubit.get(context).facilitiesModel != null)
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: HotelsCubit.get(context).searchController,
                          decoration: InputDecoration(
                              labelText: 'Search',
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    List<int> selectedFacilities =
                                        HotelsCubit.get(context)
                                            .selectedFacilities;
                                    HotelsCubit.get(context).search(
                                        searchParam: SearchParam(
                                      name: HotelsCubit.get(context)
                                          .searchController
                                          .text,
                                      facilities: {
                                        ...selectedFacilities.asMap().map(
                                              (key, value) => MapEntry(
                                                'facilities[$key]',
                                                value,
                                              ),
                                            ),
                                      },
                                    ));
                                  },
                                  icon: Icon(Icons.search))),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            HotelsCubit.get(context).changeFilterState();
                          },
                          icon: Icon(Icons.sort))
                    ],
                  ),
                const SizedBox(
                  height: 16.0,
                ),
                // MaterialButton(
                //   color: Colors.teal,
                //   onPressed: () {
                //     List<int>   selectedFacilities=   HotelsCubit.get(context).selectedFacilities;
                //     HotelsCubit.get(context).search(searchParam: SearchParam(
                //       name: HotelsCubit.get(context).searchController.text,
                //       facilities: {
                //         ...selectedFacilities.asMap().map(
                //               (key, value) => MapEntry(
                //             'facilities[$key]',
                //             value,
                //           ),
                //         ),
                //       },
                //
                //     ));
                //   },
                //   child: const Text('Search'),
                // ),
                // const SizedBox(
                //   height: 16.0,
                // ),
                Visibility(
                  visible: HotelsCubit.get(context).isFilter,
                  child: Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // runSpacing: 16.0,
                      // spacing: 16.0,
                      children: [
                        ...HotelsCubit.get(context)
                            .facilitiesModel
                            .data!
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                key,
                                InkWell(
                                  onTap: () {
                                    HotelsCubit.get(context)
                                        .selectFacility(value.id!);
                                  },
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    padding: const EdgeInsets.all(8.0),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    decoration: BoxDecoration(
                                      color: HotelsCubit.get(context)
                                              .selectedFacilities
                                              .any((element) =>
                                                  element == value.id)
                                          ? AppColors.primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Image.network(value.image!),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          value.name!,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                if (HotelsCubit.get(context).searchModel != null)
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                          HotelsCubit.get(context)
                                  .searchModel!
                                  .data
                                  .data!
                                  .length
                                  .toString() +
                              ' hotel',
                          style: Theme.of(context).textTheme.displayMedium,
                          textAlign: TextAlign.start)),
                const SizedBox(
                  height: 20.0,
                ),
                if (HotelsCubit.get(context).searchModel != null)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[300]!,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                          'http://api.mahmoudtaha.com/images/${HotelsCubit.get(context).searchModel!.data.data![index].hotelImages![math.Random().nextInt(HotelsCubit.get(context).searchModel!.data.data![index].hotelImages!.length)].image!}'),
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            HotelsCubit.get(context)
                                                .searchModel!
                                                .data
                                                .data![index]
                                                .name!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${HotelsCubit.get(context).searchModel!.data.data![index].price}\$',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rate_rounded,
                                          color: Colors.amber,
                                          size: 24,
                                        ),
                                        Text(
                                          HotelsCubit.get(context)
                                              .searchModel!
                                              .data!
                                              .data![index]
                                              .rate!,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: HotelsCubit.get(context)
                          .searchModel!
                          .data
                          .data!
                          .length,
                    ),
                  ),
                if (state is SearchHotelsLoadingState)
                  const CupertinoActivityIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

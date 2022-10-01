import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_search_form.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_explore_item.dart';
import 'package:booking_app_internship_algoriza/core/widgets/sliver_appbar.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/search_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/search.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ExploreScreen extends StatefulWidget {
   const ExploreScreen({Key? key, }) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
   HotelsModel? dataHotelsModel;

@override
  void initState() {
  getHotels ();
    super.initState();
  }

  getHotels ()async{
    AppStrings.isFilter == false ?
  await BlocProvider.of<HotelsCubit>(context).getHotels(exploreHotel:ExploreHotel(page: 1)): null;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          InkWell(
              onTap: (() {
                Navigator.of(context).pushNamed(Routes.mapScreen);
              }),
              child: Padding(
                padding: EdgeInsets.only(right: height * 0.02),
                child: Image.asset(
                  'assets/images/map.png',
                  width: width * 0.1,
                ),
              ))
        ],
        leading: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
      ),
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(height * 0.01, 0, height * 0.01, height * 0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: height * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                background: BlocBuilder<HotelsCubit, HotelStates>(
                  builder: (context, state) {
                    return SliverAppbar(
                      searchForm: CustomSearchForm(
                        hint: 'Egypt.......',
                        textController: searchController,
                      ),
                      onPressedSearch: () {
                        Navigator.pushNamed(context, Routes.searchScreen);
                        // debugPrint(searchController.text);
                        // AppStrings.isFilter == true;
                        // HotelsCubit.get(context).search(
                        //     searchParam:
                        //         SearchParam(name: searchController.text));
                      },
                    );
                  },
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              BlocBuilder<HotelsCubit, HotelStates>(
                builder: (context, state) {
                  if (state is HotelsLoadingState || state is SearchHotelsLoadingState ) {
                    return const CustomLoadingWidget();
                  }
                 else if (state is HotelsLoadedState  &&  AppStrings.isFilter == false ) {
                    dataHotelsModel = state.hotelsModel;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: dataHotelsModel!.data!.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HotelDetailsScreen(
                                    hotelDetails:
                                    dataHotelsModel!.data!.data![index]),
                              ));
                            },
                            child: HotelExploreItem(
                              dataHotels: dataHotelsModel!.data!.data![index],
                            ),
                          );
                        });
                  }
                 else if (state is SearchHotelsLoadedState  &&  AppStrings.isFilter == true) {
                    SearchModel searchModel= state.searchModel;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: searchModel.data.data!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HotelDetailsScreen(
                                    hotelDetails:
                                    searchModel.data.data![index]),
                              ));
                            },
                            child: HotelExploreItem(
                              dataHotels: searchModel.data.data![index],
                            ),
                          );
                        });
                  }
                  return Text('');
                },
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

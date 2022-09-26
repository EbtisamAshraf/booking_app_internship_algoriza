import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_explore_item.dart';
import 'package:booking_app_internship_algoriza/core/widgets/sliver_appbar.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);

  HotelsModel? dataHotelsModel;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
              flexibleSpace: const FlexibleSpaceBar(
                background: SliverAppbar(),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              BlocProvider(
                create: (context) => di.sl<HotelsCubit>()
                  ..getHotels(exploreHotel: ExploreHotel(page: 1)),
                child: BlocBuilder<HotelsCubit, HotelStates>(
                  builder: (context, state) {
                    if (state is HotelsLoadingState) {
                      return const CustomLoadingWidget();
                    }
                    if (state is HotelsLoadedState) {
                      dataHotelsModel = state.hotelsModel;
                    }
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
                  },
                ),
              ),
            ]))
          ],
        ),
      ),
    );
  }
}

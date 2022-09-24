import 'dart:async';

import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_search_form.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_explore_item.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_home_item.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/map/data/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<DataHotels>? dataHotels;
  final controller = PageController();
  static Position? position;
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _cameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  Future<void> getCurrentLocation() async {
    await LocationHelper.getCurrentLocation();

    position = await Geolocator.getLastKnownPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _cameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Widget buildPageView() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
          return Container(
            height: height * 0.1,
            width: double.infinity,
            child: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return HotelHomeItem();
                }),
          );
        }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

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
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort_rounded))],
        leading: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.35),
          child: Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Expanded(
                        child: CustomSearchForm(hint: 'Egypt.......')),
                    Container(
                      height: height * 0.15,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.teal.shade300,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Choose Date',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            '19, Sep - 24, Sep',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                        width: width * 0.02,
                        color: Colors.grey,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Number of room ',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            '1 room 2 People',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '200  Hotel found',
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.sort_rounded,
                          color: Colors.teal,
                        ),
                        label: Text(
                          'Filter',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        fit: StackFit.expand,
        children: [
          position != null
              ? buildMap()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                ),
          buildPageView(),
        ],
      ),
    );
  }
}

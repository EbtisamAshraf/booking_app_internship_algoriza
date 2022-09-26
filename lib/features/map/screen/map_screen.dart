import 'dart:async';
import 'dart:typed_data';

import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_search_form.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_explore_item.dart';
import 'package:booking_app_internship_algoriza/core/widgets/hotel_home_item.dart';
import 'package:booking_app_internship_algoriza/features/hotels/data/model/hotels_model.dart';
import 'package:booking_app_internship_algoriza/features/hotels/domain/use_cases/explore_use_cases.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_cubit.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/cubit/hotel_states.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/hotel_details.dart';
import 'package:booking_app_internship_algoriza/features/map/data/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  HotelsModel? dataHotelsModel;
  final controller = PageController();
  static Position? position;
  late CameraPosition cameraPosition;
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = Set();
  Uint8List? mapMarker;

  CameraPosition buildCameraPosition(HotelsModel hotelsModel) {
    for (int i = 0; i <= dataHotelsModel!.data!.data!.length - 1; i++) {
      cameraPosition = CameraPosition(
        bearing: 0.0,
        target: LatLng(
            double.parse(hotelsModel.data!.data![i].latitude.toString()),
            double.parse(hotelsModel.data!.data![i].longitude.toString())),
        tilt: 0.0,
        zoom: 13,
      );
    }
    return cameraPosition;
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  getMarkIcon() async {
    mapMarker = await getBytesFromAsset('assets/images/hotel-icon.png', 100);
  }

  Set<Marker> buildMarkers(HotelsModel dataHotelsModel) {
    for (int i = 0; i <= dataHotelsModel.data!.data!.length - 1; i++) {
      markers.add(Marker(
        markerId: MarkerId('$i'),
        icon: BitmapDescriptor.fromBytes(mapMarker!),
        position: LatLng(
            double.parse(dataHotelsModel.data!.data![i].latitude.toString()),
            double.parse(dataHotelsModel.data!.data![i].longitude.toString())),
        infoWindow: InfoWindow(
          title: dataHotelsModel.data!.data![i].name,
          snippet:" ${dataHotelsModel.data!.data![i].price} EPG",
        ),
      ));
    }
    return markers;
  }

  Widget buildMap() {
    return BlocProvider(
      create: (context) =>
          di.sl<HotelsCubit>()..getHotels(exploreHotel: ExploreHotel(page: 1)),
      child: BlocBuilder<HotelsCubit, HotelStates>(
        builder: (context, state) {
          if (state is HotelsLoadingState) {
            return const CustomLoadingWidget();
          }
          if (state is HotelsLoadedState) {
            dataHotelsModel = state.hotelsModel;
            return GoogleMap(
              markers: buildMarkers(dataHotelsModel!),
              mapType: MapType.normal,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              initialCameraPosition: buildCameraPosition(dataHotelsModel!),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }
          return Container(
            color: Colors.amber,
          );
        },
      ),
    );
  }

  Widget buildPageView() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) =>
          di.sl<HotelsCubit>()..getHotels(exploreHotel: ExploreHotel(page: 1)),
      child: BlocBuilder<HotelsCubit, HotelStates>(
        builder: (context, state) {
          if (state is HotelsLoadingState) {
            return const CustomLoadingWidget();
          }
          if (state is HotelsLoadedState) {
            dataHotelsModel = state.hotelsModel;
            return Container(
              height: height * 0.2,
              padding: EdgeInsets.all(height * 0.02),
              child: PageView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
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
                      child: HotelHomeItem(
                        dataHotels: dataHotelsModel!.data!.data![index],
                      ),
                    );
                  }),
            );
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildMap();
    getMarkIcon();
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.exploreScreen);
              },
              icon: Icon(Icons.sort_rounded))
        ],
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
        fit: StackFit.passthrough,
        children: [
          buildMap(),
          buildPageView(),
        ],
      ),
    );
  }
}

import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/explore_screen.dart';
 import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../utils/app_colors.dart';
import 'default_button.dart';

class SliverHeader implements SliverPersistentHeaderDelegate {
  final double minExtension;
  final double maxExtension;
  List images = [
    'assets/images/hotel.jpg',
    'assets/images/hotel2.png',
    'assets/images/hotel3.png',
  ];


  SliverHeader({required this.minExtension, required this.maxExtension});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: context.hight / 1.7,
      child: Stack(
        children: [
          CarouselSlider(
            items: images
                .map((e) => Image(
                      image: AssetImage(e.toString()),
                      fit: BoxFit.fitHeight,
                    ))
                .toList(),
            options: CarouselOptions(
              height: context.hight / 1.7,
              initialPage: 0,
              reverse: false,
              viewportFraction: 1.0,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              scrollDirection: Axis.horizontal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(25)),
                shadowColor: Color(0xFF6D6D6D).withOpacity(0.2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: AppColors.defaultColor,
                      ),
                      Text(
                        'Where are you going?'.tr(),
                        style:
                            TextStyle(color: AppColors.hintColor, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            opacity: minExtension<= 250&&maxExtension>=1 ? 1.0 :0.0,
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(top: 250.0, left: 12,right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    'Find best deals'.tr(),
                    style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                const  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Extraordinary five-star\n outdoor activities".tr(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 340, left: 12,right: 12),
            child: Row(
              children: [
                DefaultButton(text: 'View Hotel'.tr(), onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ExploreScreen()));
                }),
                const Spacer(),
                // SmoothPageIndicator(
                //   controller: pageController,
                //   count: 3,
                //   effect: JumpingDotEffect(
                //     activeDotColor: AppColors.defaultColor,
                //     dotColor: AppColors.hintColor,
                //     dotHeight: 10,
                //     dotWidth: 10,
                //     spacing: 5,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => maxExtension;

  @override
  // TODO: implement minExtent
  double get minExtent => minExtension;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  // TODO: implement showOnScreenConfiguration
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  // TODO: implement snapConfiguration
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  // TODO: implement stretchConfiguration
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  // TODO: implement vsync
  TickerProvider? get vsync => null;
}

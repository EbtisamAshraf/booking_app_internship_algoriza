import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_rating_bar/flutter_rating_bar.dart';
 import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/default_button.dart';

class HomeScreen extends StatelessWidget {
  var pageController = PageController();
  var top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black87,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: AppColors.defaultColor,
                      ),
                      Text(
                        'Where are you going?',
                        style: TextStyle(
                          color: AppColors.hintColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              expandedHeight: context.hight / 1.7,
              flexibleSpace: LayoutBuilder(

                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: context.hight / 1.7,
                        child: PageView.builder(
                          controller: pageController,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/Egypt.jpg',
                              fit: BoxFit.fitHeight,
                              width: double.infinity,
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10,300,10,0),
                        child: Row(
                          children: const [
                            Text(
                              'Find Best Deal',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Spacer(),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(300,400,10,0),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: JumpingDotEffect(
                            activeDotColor: AppColors.defaultColor,
                            dotColor: AppColors.hintColor,
                            dotHeight: 15,
                            dotWidth: 15,
                            spacing: 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(10,400,10,0),
                        child: Row(
                          children: [
                            DefaultButton(text: 'View Hotel', onClick: () {}),
                            Spacer(),
                            SmoothPageIndicator(
                              controller: pageController,
                              count: 3,
                              effect: JumpingDotEffect(
                                activeDotColor: AppColors.defaultColor,
                                dotColor: AppColors.hintColor,
                                dotHeight: 10,
                                dotWidth: 10,
                                spacing: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )),
          SliverToBoxAdapter(
            child: ListView.separated(
              primary: false,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black87,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          child: Image.asset(
                            'assets/images/Egypt.jpg',
                            width: 120,
                            height: 150,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Grand Royal Hotel',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Wembley, London',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '2.0 km to city',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: AppColors.hintColor,
                                          ),
                                        ),
                                        const Text(
                                          '\$5000',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    RatingBarIndicator(
                                      rating: 3,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: AppColors.defaultColor,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
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
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

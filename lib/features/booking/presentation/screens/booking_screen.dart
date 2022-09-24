import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/features/booking/presentation/screens/upcoming_screen.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColorLight,
          appBar: AppBar(
            title: Text('My Booking',
                style: Theme.of(context).textTheme.headlineLarge),
            centerTitle: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  TabBar(
                            tabs: const [
                              Text('Upcoming ',
                                  style:
                                      TextStyle(color: AppColors.defaultColor)),
                              Text('Completed',
                                  style:
                                      TextStyle(color: AppColors.defaultColor)),
                              Text('Cancelled ',
                                  style:
                                      TextStyle(color: AppColors.defaultColor)),
                            ],
                            indicatorColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.label,
                            isScrollable: true,
                            unselectedLabelColor: AppColors.hintColor,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
            UpComingScreen(),
            Center(child: Text("Completed")),
            Center(child: Text("Cancelled")),
          ],),
        ),
      ),
    );
  }
}

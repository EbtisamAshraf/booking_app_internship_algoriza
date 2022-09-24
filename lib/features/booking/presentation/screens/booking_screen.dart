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
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('My Booking',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child:  TabBar(
                            tabs: const [
                              Text('Upcoming ',),
                              Text('Completed',),
                              Text('Cancelled ',),
                            ],
                            indicator: BoxDecoration(),
                            labelColor: AppColors.defaultColor,
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

import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/filtter_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/home_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/profile_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/explore_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../booking/presentation/screens/booking_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int currentIndexScreen = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const BookingScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:screens[currentIndexScreen],
      bottomNavigationBar:bottomNavigationBarIcons() ,
    );
  }

  Widget bottomNavigationBarIcons() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(19.5), topLeft: Radius.circular(19.5)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndexScreen,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              setState(() {
                currentIndexScreen = index;
              });
            },
            items:  [
              BottomNavigationBarItem(
                icon:
                const Icon(Icons.search),
                label: 'Explore'.tr()
              ),
              BottomNavigationBarItem(
                icon:
                const Icon(Icons.favorite_border),
                  label: 'booking'.tr()
              ),
              BottomNavigationBarItem(
                icon:
                const Icon(Icons.person_outline),
                  label: 'Profile'.tr()
              ),

            ],
          ),
        ));
  }

}
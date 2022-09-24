import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/features/splash/data/models/onboarrding_model.dart';
import 'package:flutter/material.dart';




class CustomIndicator extends StatefulWidget {


  int index=0;
  PageController boardController;
  List<OnBoardingModel> onBoardingList;
  bool isLast ;
  VoidCallback? onPressed;

   CustomIndicator({Key? key, required this.index, required this.onBoardingList, required this.boardController , required this.isLast ,this.onPressed}) : super(key: key);

  @override
  State<CustomIndicator> createState() => _CustomIndicatorState();
}

class _CustomIndicatorState extends State<CustomIndicator> {


  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(children: List.generate(
              widget.onBoardingList.length,
                  (index) => widget.index == index ? const ActiveDot() : const InactiveDot()),
          ),

        ],),
    );
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.hintColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/features/splash/data/models/onboarrding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingSlider extends StatelessWidget {
  OnBoardingSlider(this.listOnBoardingSlider,this.index,{Key? key}) : super(key: key);

  List<OnBoardingModel> listOnBoardingSlider=[];
  int index=0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        SizedBox(
            height:
            MediaQuery.of(context).size.height *
                0.3,
            child: Image.asset(
              listOnBoardingSlider[index].image,
            )),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: listOnBoardingSlider[index].title,
        ),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0),
          child: Text(
            listOnBoardingSlider[index].body,
            style: TextStyle(color: AppColors.hintColor),
            // textTheme.bodyText2!
            //     .copyWith(height: 2),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
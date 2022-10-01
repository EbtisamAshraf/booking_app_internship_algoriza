import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/core/utils/assets_manager.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/screens/login_screen.dart';
import 'package:booking_app_internship_algoriza/features/hotels/presentation/screens/main_screen.dart';
import 'package:booking_app_internship_algoriza/features/splash/data/models/onboarrding_model.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/cubit/onboarding_cubit.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/cubit/onboarding_state.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/widgets/custom_indicator.dart';
import 'package:booking_app_internship_algoriza/features/splash/presentation/widgets/on_boarding_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/default_button.dart';
import '../../../authentication/presentation/screens/register_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    List<OnBoardingModel> onBoardingList = [
      OnBoardingModel(
          image: ImageAssets.onBoardingImage1,
          title: Text('Plan your trips'.tr(),
              style: Theme.of(context).textTheme.displayMedium),
          body: 'book one of your unique hotel to\nescape the ordinary'.tr()),
      OnBoardingModel(
          image: ImageAssets.onBoardingImage2,
          title: Text('Find best deals'.tr(),
              style: Theme.of(context).textTheme.displayMedium),
          body:
              'Find deals for any season from cosy\ncountry homes to city flats'.tr()),
      OnBoardingModel(
          image: ImageAssets.onBoardingImage3,
          title: Text('Best travelling all time'.tr(),
              style: Theme.of(context).textTheme.displayMedium),
          body:
              'Find deals for any season from cosy\ncountry homes to city flats'.tr()),
    ];

    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => OnBoardingCubit(),
          child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView.builder(
                        controller: boardController,
                        onPageChanged: (index) {
                          OnBoardingCubit.get(context)
                              .changeIndexOfOnBoardingPageView(
                                  index, onBoardingList);
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: onBoardingList.length,
                        itemBuilder: (c, i) =>
                            OnBoardingSlider(onBoardingList, i)),
                  ),
                  CustomIndicator(
                    onPressed: () {
                      if (OnBoardingCubit.get(context).isLastIndex) {
                        OnBoardingCubit.get(context).changeIsSkip();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (C) => AppStrings.token.isEmpty
                                    ? LoginScreen()
                                    : MainScreen()));
                      } else {
                        boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.easeInBack);
                      }
                    },
                    onBoardingList: onBoardingList,
                    index:
                        OnBoardingCubit.get(context).indexOfOnBoardingPageView,
                    boardController: boardController,
                    isLast: OnBoardingCubit.get(context).isLastIndex,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: customElevatedButton(
                      onPressed: () {
                        OnBoardingCubit.get(context).changeIsSkip();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (C) => AppStrings.token.isEmpty
                                    ? LoginScreen()
                                    : MainScreen()));
                      },
                      text: 'Login'.tr(),
                      context: context,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10),
                    child: DefaultButton(
                        width: double.infinity,
                        textColor: Colors.black,
                        background: Colors.white,
                        text: 'Create account'.tr(),
                        onClick: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (C) => AppStrings.token.isEmpty? const RegisterScreen() :MainScreen()));
                        }),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

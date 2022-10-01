import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_image_network.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/profile_screen_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getProfileInfo();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              BlocBuilder<AppCubit, AppState>(
                builder: (context, state) {
                  if (state is ProfileInfoLoadingState) {
                    return const Center(child: CustomLoadingWidget());
                  } else if (state is ProfileInfoLoadedState) {
                    ProfileInfoModel profileInfo = state.profileInfoModel;
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.editProfileScreenRoute,
                            arguments: profileInfo);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.profileInfoModel.data!.name!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                              Text('View and Edit profile'.tr(),
                                style: TextStyle(color: AppColors.hintColor,fontSize: 16),)
                            ],
                          ),
                          CircleAvatar(
                              radius: 30,
                            // child: CustomImageNetwork(image:profileInfo.data!.image! ,),
                               backgroundImage: NetworkImage(state.profileInfoModel.data!.image!),
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(child: CustomLoadingWidget());
                },
              ),
              const SizedBox(
                height: 30,
              ),
               ProfileOrSettingScreenItem(
                  text: 'Change Password'.tr(), iconData: Icons.lock_outline),
               ProfileOrSettingScreenItem(
                  text: 'Invite Friend'.tr(), iconData: Icons.person_outline),
               ProfileOrSettingScreenItem(
                  text: 'Credit & coupons'.tr(), iconData: Icons.card_giftcard),
               ProfileOrSettingScreenItem(
                  text: 'Help Center'.tr(), iconData: Icons.info_outline),
               ProfileOrSettingScreenItem(
                  text: 'Payment'.tr(), iconData: Icons.payment),
              ProfileOrSettingScreenItem(
                  text: 'Setting'.tr(),
                  iconData: Icons.settings,
                  onTap: () => Navigator.pushNamed(
                      context, Routes.settingScreenRoute)),
            ],
          ),
        ),
      ),
    );
  }
}

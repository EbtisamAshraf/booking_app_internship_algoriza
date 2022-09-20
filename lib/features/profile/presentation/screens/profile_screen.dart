import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/profile_screen_item.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => di.sl<ProfileCubit>()..getProfileInfo(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                BlocBuilder<ProfileCubit, ProfileState>(
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
                                Text('View and Edit profile',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall),
                              ],
                            ),
                            CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    state.profileInfoModel.data!.image!)),
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
                const ProfileOrSettingScreenItem(
                    text: 'Change Password', iconData: Icons.lock_outline),
                const ProfileOrSettingScreenItem(
                    text: 'Invite Friend', iconData: Icons.person_outline),
                const ProfileOrSettingScreenItem(
                    text: 'Credit & coupons', iconData: Icons.card_giftcard),
                const ProfileOrSettingScreenItem(
                    text: 'Help Center', iconData: Icons.info_outline),
                const ProfileOrSettingScreenItem(
                    text: 'Payment', iconData: Icons.payment),
                ProfileOrSettingScreenItem(
                    text: 'Setting',
                    iconData: Icons.settings,
                    onTap: () => Navigator.pushNamed(
                        context, Routes.settingScreenRoute)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

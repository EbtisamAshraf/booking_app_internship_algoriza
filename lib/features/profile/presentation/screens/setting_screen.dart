import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/edit_profile_screen_item.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/profile_screen_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Setting',style: Theme.of(context).textTheme.displayMedium,),
              const SizedBox(height: 40,),
               ProfileOrSettingScreenItem(text: 'Notifications'.tr(),iconData: Icons.notifications),
               ProfileOrSettingScreenItem(text: 'Theme Mode',widget: Switch(value: AppCubit.get(context).isDark, onChanged: (value){
                AppCubit.get(context).initDarkMode();
              })),
              const ProfileOrSettingScreenItem(text: 'Fonts',iconData: Icons.font_download),
              const ProfileOrSettingScreenItem(text: 'Color',iconData: Icons.color_lens),
               ProfileOrSettingScreenItem(text: 'Language',iconData: Icons.translate,onTap: ()=>  Navigator.pushNamed(context, Routes.languageScreen)),
              const EditProfileOrSettingScreenItem(title: 'Country',info: 'Egypt' ,),
              const EditProfileOrSettingScreenItem(title: 'Currency',info: '\$ US' ,),
              const ProfileOrSettingScreenItem(text: 'Terms of Services',iconData: Icons.arrow_forward_ios,size:18 ),
              const ProfileOrSettingScreenItem(text: 'Privacy Policy',iconData: Icons.arrow_forward_ios ,size:18),
              const ProfileOrSettingScreenItem(text: 'Give us Feedbacks',iconData: Icons.arrow_forward_ios ,size:18),
               ProfileOrSettingScreenItem(text: 'Log out',iconData: Icons.arrow_forward_ios ,size:18,onTap: (){
                AppStrings.token = '';
                di.sl<SharedPreferences>().remove('token');
                Navigator.pushNamed(context, Routes.loginScreenRoute);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

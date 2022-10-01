import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_strings.dart';
import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/language_screen.dart';
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
              Text('Setting'.tr(),style: Theme.of(context).textTheme.displayMedium,),
              const SizedBox(height: 40,),
               ProfileOrSettingScreenItem(text: 'Notifications'.tr(),iconData: Icons.notifications),
               ProfileOrSettingScreenItem(text: 'Theme Mode'.tr(),widget: Switch(
                   activeColor: AppColors.defaultColor,
                   value: AppCubit.get(context).isDark, onChanged: (value){
                AppCubit.get(context).initDarkMode();
              })),
               ProfileOrSettingScreenItem(text: 'Fonts'.tr(),iconData: Icons.font_download),
               ProfileOrSettingScreenItem(text: 'Color'.tr(),iconData: Icons.color_lens),
               ProfileOrSettingScreenItem(text: 'Language'.tr(),iconData: Icons.translate,onTap: ()=>
                   showDialog(context: context, builder: (context)=>AlertDialog(
                     alignment: Alignment.center,
                     content: SizedBox(
                       height: context.hight/3.8,
                       child: Column(
                         mainAxisSize: MainAxisSize.min,
                         children: [
                           Text('Language'.tr(),style: Theme.of(context).textTheme.titleLarge),
                           RadioListTile(
                               title:  Text('العربية' ,
                                   style: Theme.of(context).textTheme.displaySmall
                               ),
                               value: Languages.arabia ,
                               activeColor: AppColors.primaryColor,
                               groupValue:AppCubit.get(context).language,
                               onChanged: (Languages? value){
                                 AppCubit.get(context).changeLanguage(value);

                               }),
                           RadioListTile(
                               title:  Text('English' , style: Theme.of(context).textTheme.displaySmall
                               ),
                               value: Languages.english ,
                               activeColor: AppColors.primaryColor,
                               groupValue: AppCubit.get(context).language,
                               onChanged: (Languages? value){
                                 AppCubit.get(context).changeLanguage(value);

                               }),
                           const Spacer(),
                       TextButton(child: Text('Change Language'.tr(),style: const TextStyle(
                         color: AppColors.defaultColor
                       ),), onPressed: (){
                         context.setLocale(AppCubit.get(context).locale);
                       })
                         ],
                       ),
                     ),
                   ))
                  // Navigator.pushNamed(context, Routes.languageScreen)
               ),
               EditProfileOrSettingScreenItem(title: 'Country'.tr(),info: 'Egypt' ,),
               EditProfileOrSettingScreenItem(title: 'Currency'.tr(),info: '\$ US' ,),
               ProfileOrSettingScreenItem(text: 'Terms of Services'.tr(),iconData: Icons.arrow_forward_ios,size:18 ),
               ProfileOrSettingScreenItem(text: 'Privacy Policy'.tr(),iconData: Icons.arrow_forward_ios ,size:18),
               ProfileOrSettingScreenItem(text: 'Give us Feedbacks'.tr(),iconData: Icons.arrow_forward_ios ,size:18),
               ProfileOrSettingScreenItem(text: 'Log out'.tr(),iconData: Icons.arrow_forward_ios ,size:18,onTap: (){
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

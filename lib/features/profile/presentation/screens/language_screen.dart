
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';




enum Languages { english ,arabia}


class LanguageScreen extends StatelessWidget {
   const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final  translationCubit = BlocProvider.of<AppCubit>(context);
    return Scaffold(
     appBar: AppBar(
         title: Text('language'.tr(),style: Theme.of(context).textTheme.titleLarge)),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child:Column(
         children: [
           RadioListTile(
               title:  Text('العربية' ,  style: Theme.of(context).textTheme.displaySmall),
               value: Languages.arabia ,
               activeColor: AppColors.primaryColor,
               groupValue:AppCubit.get(context).language,
               onChanged: (Languages? value){
                 AppCubit.get(context).changeLanguage(value);

               }),
           RadioListTile(
               title:  Text('English' , style: Theme.of(context).textTheme.displaySmall),
               value: Languages.english ,
               activeColor: AppColors.primaryColor,
               groupValue: AppCubit.get(context).language,
               onChanged: (Languages? value){
                 AppCubit.get(context).changeLanguage(value);

               }),
           const Spacer(),
           Container(
               margin: const EdgeInsets.symmetric(vertical: 10.0 , horizontal: 30),
               width: MediaQuery.of(context).size.width *0.6,
               child: ElevatedButton(child:   Text('Change Language'.tr()),onPressed: (){
                 context.setLocale(AppCubit.get(context).locale);
               })),
         ],
       )
     ),
    );
  }
}

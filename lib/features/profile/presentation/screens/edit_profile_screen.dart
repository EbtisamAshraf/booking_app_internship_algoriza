import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/edit_profile_screen_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key, required this.profileInfo}) : super(key: key);
 final ProfileInfoModel profileInfo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
             Text('Edit Profile'.tr(),style: Theme.of(context).textTheme.displayMedium,),
            const SizedBox(height: 10,),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children:  [
                  CircleAvatar(radius: 50,backgroundImage: NetworkImage(profileInfo.data!.image!)),
                  const Positioned(
                    bottom: 1,
                      right: 5,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 17,
                        child: Icon(Icons.camera_alt,size: 18,color: Colors.white),)

                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
             EditProfileOrSettingScreenItem(title: 'User Name'.tr(),info:profileInfo.data!.name! ,),
             EditProfileOrSettingScreenItem(title: 'Email'.tr(),info:profileInfo.data!.email! ,),
             EditProfileOrSettingScreenItem(title: 'Phone'.tr(),info:'+02 0123456789' ,),
             EditProfileOrSettingScreenItem(title: 'Date of Birth'.tr(),info:'20, Aug, 1990' ,),
             EditProfileOrSettingScreenItem(title: 'Address'.tr(),info:'123 Royal Street, New York' ,),
          ],
        ),
      ),
    );
  }
}

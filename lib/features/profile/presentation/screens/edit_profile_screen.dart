import 'dart:io';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/profile/data/models/profile_info_model.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/screens/upload_image_screen.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/widgets/edit_profile_screen_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key, required this.profileInfo})
      : super(key: key);
  final ProfileInfoModel profileInfo;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () => AppCubit.get(context).getProfileInfo(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            if (state is UpdateProfileInfoLoadingState) {
              return const CustomLoadingWidget();
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Edit Profile'.tr(),
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              // child: CustomImageNetwork(image:'http://api.mahmoudtaha.com/images/${profileInfo.data!.image!}' ,),
                              backgroundImage: NetworkImage(
                                widget.profileInfo.data!.image!,
                              ),
                            ),
                            Positioned(
                                bottom: 1,
                                right: 5,
                                child: InkWell(
                                  onTap: () async {
                                    AppCubit.get(context).pickImage();
                                    XFile? image = AppCubit.get(context).image!;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                UploadImageScreen(
                                                  image: image,
                                                )));
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 17,
                                    child: Icon(Icons.camera_alt,
                                        size: 18, color: Colors.white),
                                  ),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  EditProfileOrSettingScreenItem(
                    title: 'User Name'.tr(),
                    info: widget.profileInfo.data!.name!,
                  ),
                  EditProfileOrSettingScreenItem(
                    title: 'Email'.tr(),
                    info: widget.profileInfo.data!.email!,
                  ),
                  EditProfileOrSettingScreenItem(
                    title: 'Phone'.tr(),
                    info: '+02 0123456789',
                  ),
                  EditProfileOrSettingScreenItem(
                    title: 'Date of Birth'.tr(),
                    info: '20, Aug, 1990',
                  ),
                  EditProfileOrSettingScreenItem(
                    title: 'Address'.tr(),
                    info: '123 Royal Street, New York',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

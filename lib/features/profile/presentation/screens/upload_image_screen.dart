import 'dart:io';
import 'dart:math';

import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/app_cubit.dart';
import 'package:booking_app_internship_algoriza/core/utils/media_query_values.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_loading_widget.dart';
import 'package:booking_app_internship_algoriza/features/profile/domain/use_cases/update_info.dart';
import 'package:booking_app_internship_algoriza/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageScreen extends StatelessWidget {
   UploadImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);
    XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            height: context.hight * 0.5,
            width: context.hight * 0.6,
            child: Image.file(File(image!.path)),
          ),
          const SizedBox(height: 30),
          BlocConsumer<AppCubit, AppState>(
            listener: (context, state){
              if(state is UpdateProfileInfoLoadedState){
                Navigator.pop(context);
                // Navigator.pushReplacementNamed(
                //     context, Routes.editProfileScreenRoute,arguments: AppCubit.get(context).profileInfo);
              }
            },
            builder: (context, state) {
              if(state is UpdateProfileInfoLoadingState ){
                return const CustomLoadingWidget();
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: customElevatedButton(
                    text: 'Upload Image',
                    onPressed: () {
                      AppCubit.get(context).updateInfo(
                          updateInfoParam: UpdateInfoParam(
                              name: AppCubit.get(context)
                                  .profileInfo
                                  .data!
                                  .name!,//${Random().nextInt(9)}
                              email: AppCubit.get(context)
                                  .profileInfo
                                  .data!
                                  .email!,
                              image: File(
                                     image!.path)
                                  ));



                    },
                    context: context),
              );
            },
          ),
        ],
      ),
    );
  }
}

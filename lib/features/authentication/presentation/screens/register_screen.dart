import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/constants.dart';
import 'package:booking_app_internship_algoriza/core/utils/validator.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/register_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/widgets/text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordConfirmationController =
      TextEditingController();

  TextEditingController nameController = TextEditingController();

  String errorEmail = '';

  String errorPassword = '';

  String errorConfirmPassword = '';

  String errorName = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            Constants.showToast(msg: state.error, clr: Colors.redAccent);
          } else if (state is RegisterLoadedState) {
            Constants.showToast(
                clr: Colors.green,
                msg: state.registerModel.status.title!.en == null
                    ? state.registerModel.status.title.toString()
                    : state.registerModel.status.title!.en.toString());
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.init, (route) => false);
          }
        },
        builder: (context, state) {
          SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.backgroundColorLight,
              appBar: AppBar(
                backgroundColor: AppColors.backgroundColorLight,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sign Up'.tr(),
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    color: const Color(0x0FF3C5799),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Row(
                                        children: [
                                          const Icon(FontAwesomeIcons.facebookF,
                                              size: 20, color: Colors.white),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'Facebook'.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 55,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    color: Color(0x0FF05A9F0),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 30.0),
                                      child: Row(
                                        children: [
                                          const Icon(FontAwesomeIcons.twitter,
                                              size: 20, color: Colors.white),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'Twitter'.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text('or log in with email'.tr(),
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                          ),
                          const SizedBox(height: 20),
                          CommonTextFieldView(
                            titleText: 'Your name'.tr(),
                            hintText: 'enter your name'.tr(),
                            errorText: errorName,
                            controller: nameController,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          CommonTextFieldView(
                            titleText: 'Your email'.tr(),
                            hintText: 'enter your email'.tr(),
                            errorText: errorEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 10),
                          CommonTextFieldView(
                            errorText: errorPassword,
                            controller: passwordController,
                            titleText: 'Password'.tr(),
                            hintText: 'enter your password'.tr(),
                            keyboardType: TextInputType.visiblePassword,
                            icon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon:
                                    RegisterCubit.get(context).isPasswordVisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: AppColors.hintColor,
                                          )
                                        : Icon(Icons.visibility_off,
                                            color: AppColors.hintColor)),
                            isPasswordVisible:
                                RegisterCubit.get(context).isPasswordVisible,
                          ),
                          const SizedBox(height: 10),
                          CommonTextFieldView(
                            errorText: errorConfirmPassword,
                            controller: passwordConfirmationController,
                            titleText: 'Password'.tr(),
                            hintText: 'enter your password'.tr(),
                            keyboardType: TextInputType.visiblePassword,
                            icon: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context)
                                      .changePasswordConfirmationVisibility();
                                },
                                icon: RegisterCubit.get(context)
                                        .isPasswordConfirmationVisible
                                    ? Icon(
                                        Icons.visibility,
                                        color: AppColors.hintColor,
                                      )
                                    : Icon(Icons.visibility_off,
                                        color: AppColors.hintColor)),
                            isPasswordVisible: RegisterCubit.get(context)
                                .isPasswordConfirmationVisible,
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Builder(builder: (context) {
                              return state is RegisterLoadingState
                                  ? const CircularProgressIndicator.adaptive()
                                  : customElevatedButton(
                                      context: context,
                                      text: 'Sign Up'.tr(),
                                      onPressed: () {
                                        //  if (formKey.currentState!.validate()) {
                                        if (allValidation()) {
                                          RegisterCubit.get(context).userRegister(
                                              registerParam: RegisterParam(
                                                  name: nameController.text,
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text,
                                                  passwordConfirmation:
                                                      passwordConfirmationController
                                                          .text,
                                                  image: ''));
                                        }
                                      });
                            }),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                              child: Text(
                            'By Signing up,you agreed with our terms of \n  '
                                    '        Services an privacy policy'
                                .tr(),
                            style: TextStyle(color: AppColors.hintColor),
                          )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have account?'.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.loginScreenRoute);
                                  },
                                  child: Text('Login'.tr(),
                                      style: const TextStyle(
                                          color: AppColors.defaultColor))),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool allValidation() {
    bool isValid = true;

    if (nameController.text.trim().isEmpty) {
      errorName = 'Please enter your name'.tr();
      isValid = false;
    } else {
      errorName = '';
    }

    if (emailController.text.trim().isEmpty) {
      errorEmail = 'please enter your email address'.tr();
      isValid = false;
    } else if (!Validator.validateEmail(emailController.text.trim())) {
      errorEmail = 'please enter valid email'.tr();
      isValid = false;
    } else {
      errorEmail = '';
    }

    if (passwordController.text.trim().isEmpty) {
      errorPassword = 'please enter your password'.tr();
      isValid = false;
    } else if (passwordController.text.trim().length < 6) {
      errorPassword = 'password is too short'.tr();
      isValid = false;
    } else {
      errorPassword = '';
    }
    if (passwordConfirmationController.text.trim().isEmpty) {
      errorConfirmPassword = 'please enter your password'.tr();
      isValid = false;
    } else if (passwordController.text != passwordController.text) {
      errorConfirmPassword = 'password is not matched'.tr();
      isValid = false;
    } else {
      errorConfirmPassword = '';
    }
    setState(() {});
    return isValid;
  }
}

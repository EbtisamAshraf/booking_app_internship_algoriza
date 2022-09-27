import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/utils/app_colors.dart';
import 'package:booking_app_internship_algoriza/core/utils/constants.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;
import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String errorEmail = '';

  String errorPassword = '';

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => di.sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              Constants.showToast(msg: state.error, clr: Colors.redAccent);
            } else if (state is LoginLoadedState) {
              Constants.showToast(
                  clr: Colors.green,
                  msg: state.loginModel.status.title!.en == null
                      ? state.loginModel.status.title.toString()
                      : state.loginModel.status.title!.en.toString());
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.init, (route) => false);
            }
          },
          builder: (context, state) {
            SystemChrome.setSystemUIOverlayStyle(
                SystemUiOverlayStyle(statusBarColor: Colors.transparent));
            return Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: AppColors.backgroundColorLight,
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        //   mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Login'.tr(),
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
                          const SizedBox(height: 30),
                          CommonTextFieldView(
                            titleText: 'Your email'.tr(),
                            hintText: 'enter your email'.tr(),
                            errorText: errorEmail,
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          CommonTextFieldView(
                            errorText: errorPassword,
                            controller: passwordController,
                            titleText: 'Password'.tr(),
                            hintText: 'enter your password'.tr(),
                            keyboardType: TextInputType.visiblePassword,
                            icon: IconButton(
                                onPressed: () {
                                  LoginCubit.get(context)
                                      .changePasswordVisibility();
                                },
                                icon: LoginCubit.get(context).isPasswordVisible
                                    ? Icon(
                                        Icons.visibility,
                                        color: AppColors.hintColor,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: AppColors.hintColor,
                                      )),
                            isPasswordVisible:
                                LoginCubit.get(context).isPasswordVisible,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot your Password?'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall)),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Builder(builder: (context) {
                              return state is LoginLoadingState
                                  ? const CircularProgressIndicator.adaptive()
                                  : customElevatedButton(
                                      context: context,
                                      text: 'Login'.tr(),
                                      onPressed: () {
                                        //  if (formKey.currentState!.validate()) {
                                        if (_allValidation()) {
                                          LoginCubit.get(context).userLogin(
                                              loginUserParam: LoginUserParam(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text));
                                        }

                                        //  }
                                      });
                            }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account?'.tr(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.registerScreenRoute);
                                  },
                                  child: Text('Sign Up'.tr(),
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
            );
          },
        ),
      ),
    );
  }

  bool _allValidation() {
    bool isValid = true;
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
    setState(() {});
    return isValid;
  }
}

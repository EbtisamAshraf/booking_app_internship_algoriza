import 'package:booking_app_internship_algoriza/config/routes/app_routes.dart';
import 'package:booking_app_internship_algoriza/core/utils/constants.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_text_form_field.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/login_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: BlocProvider(
        create: (context) => di.sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if(state is LoginErrorState){
              Constants.showToast(msg: state.error,clr: Colors.redAccent);
            }else if (state is LoginLoadedState){
              Constants.showToast(clr: Colors.green,msg: state.loginModel.status.title!.ar == null? state.loginModel.status.title.toString() :state.loginModel.status.title!.ar.toString());
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(20.0),
                    color: Colors.white,
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Welcome,',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, Routes.registerScreenRoute);
                                  },
                                  child: Text('Sign Up',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('Sign in to Continue',
                              style: Theme.of(context).textTheme.displaySmall),
                          const SizedBox(height: 50),
                          customEmailTextFormField(
                              context: context,
                              emailController: emailController),
                          const SizedBox(height: 40),
                          customPasswordTextFormField(
                            text: 'Password',
                              context: context,
                              passwordController: passwordController,
                              icon: IconButton(
                                  onPressed: () {
                                    LoginCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  icon:
                                      LoginCubit.get(context).isPasswordVisible
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                              isPasswordVisible:
                                  LoginCubit.get(context).isPasswordVisible),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text('Forgot Password?',
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
                                      text: 'SIGN IN',
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          LoginCubit.get(context).userLogin(
                                            loginUserParam:LoginUserParam(
                                              email:emailController.text ,
                                              password: passwordController.text
                                            ) );

                                        }
                                      });
                            }),
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
}

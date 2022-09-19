
import 'package:booking_app_internship_algoriza/core/utils/constants.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_button.dart';
import 'package:booking_app_internship_algoriza/core/widgets/custom_text_form_field.dart';
import 'package:booking_app_internship_algoriza/features/authentication/domain/use_cases/register_user.dart';
import 'package:booking_app_internship_algoriza/features/authentication/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:booking_app_internship_algoriza/injection_container.dart' as di;

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmationController = TextEditingController();
    TextEditingController nameController = TextEditingController();


    return BlocProvider(
      create: (context) => di.sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if(state is RegisterErrorState){
            Constants.showToast(msg: state.error,clr: Colors.redAccent);
          }else if (state is RegisterLoadedState){
            Constants.showToast(clr: Colors.green,msg: state.registerModel.status.title!.ar == null? state.registerModel.status.title.toString() :state.registerModel.status.title!.ar.toString());
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(),
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
                          Text('Sign Up',
                              style: Theme.of(context).textTheme.headlineLarge),
                          const SizedBox(height: 50),
                          customTextFormField(
                              context: context,
                              title: 'Name',
                              controller: nameController,
                              hint: 'Enter your name',
                              keyboardType: TextInputType.text,
                              validatorMassage: 'please Enter your name'),
                          const SizedBox(height: 40),
                          customEmailTextFormField(
                              context: context, emailController: emailController),
                          const SizedBox(height: 40),
                          customPasswordTextFormField(
                            text: 'Password',
                              context: context,
                              passwordController: passwordController,
                              icon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordVisibility();
                                  },
                                  icon:
                                  RegisterCubit.get(context).isPasswordVisible
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility)),
                              isPasswordVisible:
                              RegisterCubit.get(context).isPasswordVisible),

                          const SizedBox(height: 40),
                          customPasswordTextFormField(
                            text: 'Password Confirm',
                              context: context,
                              passwordController: passwordConfirmationController,
                              icon: IconButton(
                                  onPressed: () {
                                    RegisterCubit.get(context)
                                        .changePasswordConfirmationVisibility();
                                  },
                                  icon:
                                      RegisterCubit.get(context).isPasswordConfirmationVisible
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                              isPasswordVisible:
                                  RegisterCubit.get(context).isPasswordConfirmationVisible),
                          const SizedBox(height: 50),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: Builder(builder: (context) {
                              return state is RegisterLoadingState
                                  ? const CircularProgressIndicator.adaptive()
                                  : customElevatedButton(
                                      context: context,
                                      text: 'SIGN UP',
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          RegisterCubit.get(context).userRegister(
                                            registerParam:RegisterParam(
                                              name:nameController.text,
                                              email:  emailController.text,
                                              password: passwordController.text,
                                              passwordConfirmation: passwordConfirmationController.text,
                                              image: ''
                                            )) ;

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
            ),
          );
        },
      ),
    );
  }
}

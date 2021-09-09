import 'package:basket/business_logic/cubit/register_cubit/register_cubit.dart';
import 'package:basket/presentation/widgets/buttons.dart';
import 'package:basket/presentation/widgets/text_form_field.dart';
import 'package:basket/presentation/widgets/toast.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:basket/shared/helpers/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            if (state.registerModel.status) {
              CacheHelper.saveData(
                      key: 'token', value: state.registerModel.data!.token)
                  .then((value) {
                Navigator.pushReplacementNamed(context, homeScreen);
              });
            } else {
              showToast(
                  text: state.registerModel.message, state: ToastStates.error);
            }
          }
        },
        builder: (context, state) {
          final regCubit = RegisterCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(30.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Let\'s Get Started!',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Create an account to Basket to get all features',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 50.0),
                        defaultTFF(
                          prefix: Icons.person,
                          label: 'User Name',
                          controller: nameController,
                          inputType: TextInputType.name,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please type your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25.0),
                        defaultTFF(
                          prefix: Icons.email,
                          label: 'E-mail Address',
                          controller: emailController,
                          inputType: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please type your email address';
                            } else if (!value.contains('@')) {
                              return 'Please type a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25.0),
                        defaultTFF(
                          prefix: Icons.phone_android,
                          label: 'Phone Number',
                          controller: phoneNumberController,
                          inputType: TextInputType.phone,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please type your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 25.0),
                        defaultTFF(
                          prefix: Icons.lock,
                          label: 'Password',
                          controller: passwordController,
                          isObscure: regCubit.isObscure,
                          inputType: TextInputType.visiblePassword,
                          suffix: regCubit.suffix,
                          onSuffixPressed: regCubit.changePasswordVisibility,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please type your password';
                            } else if (value.length < 6) {
                              return 'short password!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 50.0),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! RegisterLoadingState,
                          widgetBuilder: (context) => buildElevatedButton(
                            context: context,
                            label: 'Sign Up',
                            height: 50.0,
                            width: 170.0,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                regCubit.userRegister(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  phoneNumber: phoneNumberController.text,
                                );
                              }
                            },
                          ),
                          fallbackBuilder: (context) => const Center(
                              child: CircularProgressIndicator(
                            color: defaultColor,
                          )),
                        ),
                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            buildTextButton(
                              label: 'Log In',
                              function: () {
                                Navigator.pushReplacementNamed(
                                    context, loginScreen);
                              },
                              context: context,
                            ),
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
    );
  }
}

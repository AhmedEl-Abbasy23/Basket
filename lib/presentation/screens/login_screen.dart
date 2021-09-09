import 'package:basket/business_logic/cubit/login_cubit/login_cubit.dart';
import 'package:basket/presentation/widgets/buttons.dart';
import 'package:basket/presentation/widgets/text_form_field.dart';
import 'package:basket/presentation/widgets/toast.dart';
import 'package:basket/shared/styles/colors.dart';
import 'package:basket/shared/constants/strings.dart';
import 'package:basket/shared/helpers/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                Navigator.pushReplacementNamed(context, homeScreen);
              });
            } else {
              showToast(
                  text: state.loginModel.message, state: ToastStates.error);
            }
          }
        },
        builder: (context, state) {
          final logCubit = LoginCubit.get(context);
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
                        const Image(
                          image: AssetImage('assets/images/login.png'),
                          height: 170.0,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Welcome Back!',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          'Log in to your existent account of Basket',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(height: 50.0),
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
                            prefix: Icons.lock,
                            label: 'Password',
                            controller: passwordController,
                            isObscure: logCubit.isObscure,
                            inputType: TextInputType.visiblePassword,
                            suffix: logCubit.suffix,
                            onSuffixPressed: logCubit.changePasswordVisibility,
                            validate: (value) {
                              if (value.isEmpty) {
                                return 'Please type your password';
                              } else if (value.length < 6) {
                                return 'short password!';
                              }
                              return null;
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {
                                logCubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            }),
                        const SizedBox(height: 50.0),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                              state is! LoginLoadingState,
                          widgetBuilder: (context) => buildElevatedButton(
                            context: context,
                            label: 'Log in',
                            height: 50.0,
                            width: 170.0,
                            function: () {
                              if (formKey.currentState!.validate()) {
                                logCubit.userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
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
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            buildTextButton(
                              label: 'Sign Up',
                              function: () {
                                Navigator.pushReplacementNamed(
                                    context, registerScreen);
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

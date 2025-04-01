import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swigato/core/common/widgets/app_main_button.dart';
import 'package:swigato/core/common/widgets/back_button.dart';
import 'package:swigato/core/common/widgets/custom_appbar.dart';
import 'package:swigato/core/common/widgets/loader.dart';
import 'package:swigato/core/common/widgets/widget_fuction_combine.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/utils/show_snackbar.dart';
import 'package:swigato/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:swigato/features/auth/presentation/widgets/auth_field.dart';

class SignUp extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUp());
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    reTypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.darkBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            return showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Loader();
          }
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // My custome appbar
                Container(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: CustomAppbar(
                    firstWidget: WidgetFuctionCombine(
                        widget: const AppBackButton(),
                        functionality: () {
                          Navigator.pop(context);
                        }),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const Text(
                    AppText.singUp,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        // fontFamily: FontFamily.sen,
                        color: AppPallete.lightHeadLine1),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: const Text(
                    AppText.signUpMessage,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppPallete.secondaryLightTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      color: AppPallete.lightBackgroundColor,
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          children: [
                            /// This will take available space while making the form scrollable
                            Expanded(
                              child: SingleChildScrollView(
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minHeight: constraints
                                        .maxHeight, // Ensures full height
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AuthField(
                                        textController: nameController,
                                        hintText: AppText.nameHintText,
                                        label: AppText.name,
                                      ),
                                      const SizedBox(height: 24),
                                      AuthField(
                                        textController: emailController,
                                        hintText: AppText.exampleEmail,
                                        label: AppText.email,
                                      ),
                                      const SizedBox(height: 24),
                                      AuthField(
                                        textController: passwordController,
                                        hintText: AppText.passwordObsured,
                                        label: AppText.password,
                                        obscureText: true,
                                      ),
                                      const SizedBox(height: 24),
                                      AuthField(
                                        textController:
                                            reTypePasswordController,
                                        hintText: AppText.passwordObsured,
                                        passwordController: passwordController,
                                        label: AppText.reTypePassword,
                                        obscureText: true,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            /// Sticky Button at the Bottom
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: AppButton(
                                buttonText: AppText.singUp,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(
                                          AuthSignUp(
                                            name: nameController.text.trim(),
                                            email: emailController.text.trim(),
                                            password:
                                                passwordController.text.trim(),
                                          ),
                                        );
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

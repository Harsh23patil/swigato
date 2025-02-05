import 'package:flutter/material.dart';
import 'package:swigato/core/common/widgets/app_main_button.dart';
import 'package:swigato/core/common/widgets/custom_appbar.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/theme/textstyle.dart';
import 'package:swigato/features/auth/presentation/pages/forgot_password.dart';
import 'package:swigato/features/auth/presentation/pages/sign_up.dart';
import 'package:swigato/features/auth/presentation/widgets/auth_field.dart';
import 'package:swigato/features/auth/presentation/widgets/login_icon_options.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMeChecke = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppPallete.darkBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppPallete.darkBackgroundColor,
        toolbarHeight: 0,
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // My custome appbar
            CustomAppbar(
                // firstWidget: WidgetFuctionCombine(
                //     widget: const AppBackButton(), functionality: () {}),
                ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                AppText.LOGIN,
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
                "Please sign in to your existing account",
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthField(
                                    textController: emailController,
                                    hintText: AppText.exampleEmail,
                                    label: 'Email',
                                  ),
                                  const SizedBox(height: 24),
                                  AuthField(
                                    textController: passwordController,
                                    hintText: "* * * * * * * *",
                                    label: 'Password',
                                    obscureText: true,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Checkbox(
                                            value: rememberMeChecke,
                                            onChanged: (value) {
                                              setState(() {
                                                rememberMeChecke =
                                                    value ?? false;
                                              });
                                            },
                                            activeColor: AppPallete.buttonColor,
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            // shape: OutlinedBorder(side: BorderSide()),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5) // Customize shape
                                                ),
                                            side: const BorderSide(
                                                color: AppPallete
                                                    .checkBoxBorderColor,
                                                width:
                                                    2 // Border color// Border thickness
                                                ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                rememberMeChecke =
                                                    !rememberMeChecke;
                                              });
                                            },
                                            child: const Text(
                                              "Remember me",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                                color: AppPallete
                                                    .checkBoxLabelColor,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(context, ForgotPassword.route());
                                        },
                                        child: const Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: AppPallete.buttonColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 22),
                                  Container(
                                    child: const AppButton(
                                      buttonText: "Log In",
                                    ),
                                  ),
                                  const SizedBox(height: 34),
                                  Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context, SignUp.route());
                                      },
                                      child: RichText(
                                        text: const TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Don't have an account? ",
                                              style: TextStyle(
                                                  fontFamily: FontFamily.sen,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      AppPallete.darkHeadLine2),
                                            ),
                                            TextSpan(
                                              text: "SIGN UP",
                                              style: TextStyle(
                                                  fontFamily: FontFamily.sen,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppPallete.buttonColor),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const Center(
                                    child: Text(
                                      "Or",
                                      style: TextStyle(fontSize: 16, color: AppPallete.darkHeadLine2),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const LoginIconOptions(),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// Sticky Button at the Bottom
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

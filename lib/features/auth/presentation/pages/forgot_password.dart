import 'package:flutter/material.dart';
import 'package:swigato/core/common/widgets/app_main_button.dart';
import 'package:swigato/core/common/widgets/back_button.dart';
import 'package:swigato/core/common/widgets/custom_appbar.dart';
import 'package:swigato/core/common/widgets/widget_fuction_combine.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/features/auth/presentation/widgets/auth_field.dart';

class ForgotPassword extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ForgotPassword());
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppPallete.darkBackgroundColor,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // My custome appbar
            CustomAppbar(
              firstWidget: WidgetFuctionCombine(
                  widget: const AppBackButton(),
                  functionality: () {
                    Navigator.pop(context);
                  }),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                AppText.forgotPassword,
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
                                    authoFocus: true,
                                  ),
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
                            onPressed: () {},
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
      ),
    );
  }
}

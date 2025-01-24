import 'package:flutter/material.dart';
import 'package:swigato/core/common/widgets/back_button.dart';
import 'package:swigato/core/common/widgets/custom_appbar.dart';
import 'package:swigato/core/common/widgets/widget_fuction_combine.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/theme/textstyle.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.darkBackgroundColor,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // My custome appbar
            CustomAppbar(
              firstWidget: WidgetFuctionCombine(
                  widget: const AppBackButton(), functionality: () {}),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: const Text(
                AppText.SIGNUP,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: FontFamily.sen,
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

            SizedBox(height: 48),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: AppPallete.lightBackgroundColor,
                ),
                child: SingleChildScrollView(
                  child: Column(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

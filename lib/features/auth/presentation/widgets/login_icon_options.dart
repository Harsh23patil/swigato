import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class LoginIconOptions extends StatelessWidget {
  const LoginIconOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginOpetion(
          filePath: "resources/assets/images/facebook_logo.svg",
        ),
        SizedBox(width: 30),
        LoginOpetion(
          filePath: "resources/assets/images/twitter_logo.svg",
        ),
        SizedBox(width: 30),
        LoginOpetion(
          filePath: "resources/assets/images/apple_logo.svg",
        ),
      ],
    );
  }
}

class LoginOpetion extends StatelessWidget {
  final String filePath;
  const LoginOpetion({super.key, required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      width: 62,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppPallete.darkHeadLine2),
      child: Center(
        child: SvgPicture.asset(
          filePath,
        ),
      ),
    );
  }
}

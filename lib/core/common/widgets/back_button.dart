import 'package:flutter/material.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 7),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppPallete.lightBackgroundColor),
      child: const Icon(
        Icons.arrow_back_ios,
        size: 20,
        color: AppPallete.darkHeadLine1,
      ),
    );
  }
}

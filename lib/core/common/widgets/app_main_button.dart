import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/theme/textstyle.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  const AppButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 62,
      decoration: BoxDecoration(
        color: AppPallete.buttonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppPallete.transparentColor,
          shadowColor: AppPallete.transparentColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Set your desired radius
          ),
        ),
        onPressed: () {
        },
        child: Text(
          buttonText,
          style: const TextStyle(
            fontSize: 14,
            color: AppPallete.secondaryLightTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

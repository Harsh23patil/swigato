import 'package:flutter/material.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class MyProfileIcon extends StatelessWidget {
  const MyProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 7),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: AppPallete.gray50),
      child: const Icon(
        Icons.menu_outlined,
        size: 20,
        color: AppPallete.darkBackgroundColor,
      ),
    );
  }
}

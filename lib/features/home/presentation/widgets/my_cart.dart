import 'package:flutter/material.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(left: 7),
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppPallete.blue800,
      ),
      child: const Icon(
        Icons.shopping_bag_outlined,
        size: 20,
        color: AppPallete.white,
      ),
    );
  }
}

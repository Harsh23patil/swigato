import 'package:flutter/material.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class DeliverTo extends StatelessWidget {
  const DeliverTo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.deliverTo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppPallete.buttonColor,
            ),
          ),
          Row(
            children: [
              Text(
                "Harshal IT office",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppPallete.gray500,
                ),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          )
        ],
      ),
    );
  }
}

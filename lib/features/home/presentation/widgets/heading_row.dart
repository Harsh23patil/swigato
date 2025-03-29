import 'package:flutter/material.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class HeadingRow extends StatelessWidget {
  final String headingRowTitle;
  const HeadingRow({
    super.key,
    required this.headingRowTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingRowTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppPallete.darkHeadLine1,
          ),
        ),
        const Row(
          children: [
            Text(
              AppText.seeAll,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppPallete.gray600,
              ),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              size: 14,
              color: AppPallete.gray200,
            )
          ],
        )
      ],
    );
  }
}

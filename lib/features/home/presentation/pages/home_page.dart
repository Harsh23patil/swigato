import 'package:flutter/material.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/features/home/presentation/widgets/deliver_to.dart';
import 'package:swigato/features/home/presentation/widgets/my_cart.dart';
import 'package:swigato/features/home/presentation/widgets/my_profile_icon.dart';

import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/widget_fuction_combine.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.lightBackgroundColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App bar section
            CustomAppbar(
              firstWidget: WidgetFuctionCombine(
                widget: const MyProfileIcon(),
                functionality: () {
                  // Navigator.pop(context);
                },
              ),
              secWidget: WidgetFuctionCombine(
                widget: const DeliverTo(),
                functionality: () {},
              ),
              fourthWidget: WidgetFuctionCombine(
                widget: const MyCart(),
                functionality: () {},
              ),
            ),

            // paddign from app bar
            const SizedBox(
              height: 24,
            ),
            // gretting section
            Container(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Hey Harshal,",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: AppPallete.gray700,
                      ),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: AppText.goodMorning,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppPallete.gray700,
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            // search box field
            SizedBox(
              height: 62,
              child: TextField(
                decoration: InputDecoration(
                  hintText: AppText.searchDishes,
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppPallete.gray500,
                  ),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: AppPallete.blue200,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: AppPallete.red50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

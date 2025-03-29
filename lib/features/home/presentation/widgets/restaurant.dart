import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/features/home/data/restaurant_info.dart';

class Restaurant extends StatelessWidget {
  final RestaurantInfo restaurantInfo;
  const Restaurant({
    super.key,
    required this.restaurantInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(),
      // decoration: BoxDecoration(
      //     border: Border.all(
      //   color: Color.fromARGB(255, 230, 230, 230),
      //   width: 2,
      // )
      //     // boxShadow: [
      //     //   BoxShadow(
      //     //     color: Color.fromARGB(97, 155, 155, 155), // Shadow color
      //     //     blurRadius: 30, // Softness of the shadow
      //     //     spreadRadius: 0, // How much shadow extends
      //     //     offset: Offset(4, 5), // Shadow position (x, y)
      //     //   ),
      //     // ],
      //     ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 145,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppPallete.blue250,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Text(
              restaurantInfo.restaurantName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppPallete.blue800,
              ),
            ),
          ),
          const SizedBox(
            height: 0,
          ),
          Row(
            children: restaurantInfo.menuList.asMap().entries.map(
              (entry) {
                int index = entry.key;
                var menuItem = entry.value;

                if (index >= 4) return Container();

                return Text(
                  index == 0 ? menuItem : "- ${menuItem}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppPallete.gray200,
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_rounded,
                      color: AppPallete.buttonColor,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      restaurantInfo.rating.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppPallete.blue800,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 28,
                ),
                if (restaurantInfo.isDeliveryFree)
                  Row(
                    children: [
                      SvgPicture.asset("resources/assets/images/delivery.svg"),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        "Free",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppPallete.blue800,
                        ),
                      )
                    ],
                  ),
                if (restaurantInfo.isDeliveryFree)
                  const SizedBox(
                    width: 28,
                  ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      color: AppPallete.buttonColor,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "${restaurantInfo.maxTime.toStringAsFixed(0)} min",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppPallete.blue800,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Divider(
          //   color: AppPallete.gray50,
          //   thickness: 1,
          // ),
          const SizedBox(
            height: 28,
          )
        ],
      ),
    );
  }
}

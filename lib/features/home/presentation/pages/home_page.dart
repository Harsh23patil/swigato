import 'package:flutter/material.dart';
import 'package:swigato/core/constants/texts.dart';
import 'package:swigato/core/theme/app_pallete.dart';
import 'package:swigato/core/theme/textstyle.dart';
import 'package:swigato/features/home/data/restaurant_info.dart';
import 'package:swigato/features/home/presentation/widgets/deliver_to.dart';
import 'package:swigato/features/home/presentation/widgets/heading_row.dart';
import 'package:swigato/features/home/presentation/widgets/my_cart.dart';
import 'package:swigato/features/home/presentation/widgets/my_profile_icon.dart';
import 'package:swigato/features/home/presentation/widgets/restaurant.dart';
import 'package:swigato/features/home/presentation/widgets/trapper_container.dart';

import '../../../../core/common/widgets/custom_appbar.dart';
import '../../../../core/common/widgets/widget_fuction_combine.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodCategory> foodCategoryList = [];
  List<RestaurantInfo> openRestaurantList = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _searchController.addListener(() {
      setState(() {
        _showClearButton = _searchController.text.isNotEmpty;
      });
    });

    openRestaurantList.add(
      RestaurantInfo(
        restaurantName: "Rose Garden Restaurant",
        menuList: ["Burger", "Chiken", "Riche", "Wings"],
        rating: 4.7,
        isDeliveryFree: true,
        maxTime: 20,
      ),
    );

    openRestaurantList.add(
      RestaurantInfo(
        restaurantName: "Garden Restaurant",
        menuList: [
          "Riche",
          "Chiken",
          "Coffee",
          "Wings",
          "Riche",
          "Chiken",
          "Coffee",
          "Wings",
          "Riche",
          "Chiken",
          "Coffee",
          "Wings"
        ],
        rating: 4.2,
        isDeliveryFree: true,
        maxTime: 25,
      ),
    );

    openRestaurantList.add(
      RestaurantInfo(
        restaurantName: "Rajvadi Cafe",
        menuList: ["Coffee", "Tea", "Milkshake", "Burger"],
        rating: 4.5,
        isDeliveryFree: true,
        maxTime: 22,
      ),
    );

    openRestaurantList.add(
      RestaurantInfo(
        restaurantName: "Garden Restaurant",
        menuList: ["Riche", "Chiken", "Coffee", "Wings"],
        rating: 4.3,
        isDeliveryFree: false,
        maxTime: 25,
      ),
    );

    foodCategoryList.add(
      FoodCategory(
        foodItem: "Piza",
        price: "50",
      ),
    );

    foodCategoryList.add(
      FoodCategory(
        foodItem: "Burger",
        price: "30",
      ),
    );

    foodCategoryList.add(
      FoodCategory(
        foodItem: "Momo",
        price: "40",
      ),
    );

    foodCategoryList.add(
      FoodCategory(
        foodItem: "Pasta",
        price: "45",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.lightBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
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
                  controller: _searchController,
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
                    suffixIcon: (_showClearButton)
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                setState(() {
                                  _showClearButton = false;
                                });
                              },
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppPallete.gray150,
                                ),
                                child: const Center(
                                  child: Text(
                                    "X",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppPallete.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: AppPallete.red50,
                  ),
                ),
              ),

              const SizedBox(
                height: 32,
              ),

              const HeadingRow(
                headingRowTitle: AppText.allCategory,
              ),

              const SizedBox(
                height: 28,
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: foodCategoryList.map((item) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 14),
                          height: 178,
                          width: 147,
                          // color: Colors.amber,
                        ),
                        Positioned(
                          bottom: 7,
                          child: Container(
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(
                                      70, 219, 219, 219), // Shadow color
                                  blurRadius: 30, // Softness of the shadow
                                  spreadRadius: 0, // How much shadow extends
                                  offset:
                                      Offset(4, 5), // Shadow position (x, y)
                                ),
                              ],
                            ),
                            child: TaperedContainer(
                              foodItem: item.foodItem,
                              price: item.price,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 14,
                          child: Container(
                            height: 104,
                            width: 122,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppPallete.blue250,
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),

              const SizedBox(
                height: 32,
              ),

              const HeadingRow(
                headingRowTitle: AppText.OpenRestaurant,
              ),

              const SizedBox(
                height: 20,
              ),

              if (openRestaurantList.length >= 1)
                SingleChildScrollView(
                  child: Column(
                    children: openRestaurantList.map((restaurant) {
                      return Restaurant(
                        restaurantInfo: restaurant,
                      );
                    }).toList(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCategory {
  final String foodItem;
  final String price;

  FoodCategory({
    required this.foodItem,
    required this.price,
  });
}

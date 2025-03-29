class RestaurantInfo {
  final String restaurantName;
  final List<String> menuList;
  final double rating;
  final bool isDeliveryFree;
  final double maxTime;

  RestaurantInfo({
    required this.restaurantName,
    required this.menuList,
    required this.rating,
    required this.isDeliveryFree,
    required this.maxTime,
  });
}

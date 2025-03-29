import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class TaperedContainer extends StatefulWidget {
  final String foodItem;
  final String price;

  const TaperedContainer({
    super.key,
    required this.foodItem,
    required this.price,
  });

  @override
  State<TaperedContainer> createState() => _TaperedContainerState();
}

class _TaperedContainerState extends State<TaperedContainer> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TaperClipper(),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        color: Colors.white,
        width: 147,
        height: 144,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.foodItem,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Starting",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppPallete.gray300,
                        ),
                      ),
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppPallete.gray700,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaperClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..moveTo(5, 20)
      ..quadraticBezierTo(5, 0, 25, 0)
      ..lineTo(size.width - 25, 0)
      ..quadraticBezierTo(size.width - 5, 0, size.width - 5, 20)
      ..lineTo(size.width, size.height - 20)
      ..quadraticBezierTo(size.width, size.height, size.width - 20, size.height)
      ..lineTo(20, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - 20);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';

class IconImage extends StatelessWidget {
  const IconImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(255, 155, 155, 155),
          ),
        ),

        // child: ,
      ),
    );
  }
}

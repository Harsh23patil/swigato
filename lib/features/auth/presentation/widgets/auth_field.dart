import 'package:flutter/material.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final String label;
  final bool obscureText;
  const AuthField({
    super.key,
    required this.hintText,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(label),
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppPallete.authHintTextColor,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          obscureText: obscureText,
          obscuringCharacter: '*',
        ),
      ],
    );
  }
}

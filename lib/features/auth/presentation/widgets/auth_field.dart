import 'package:flutter/material.dart';
import 'package:swigato/core/theme/app_pallete.dart';

class AuthField extends StatefulWidget {
  final String hintText;
  final String label;
  final bool obscureText;
  final TextEditingController textController;
  final bool authoFocus;
  const AuthField({
    super.key,
    required this.hintText,
    required this.label,
    required this.textController,
    this.obscureText = false,
    this.authoFocus = false,
  });

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {

  bool showPassword = false;

  @override
  void initState() {
    showPassword = widget.obscureText;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(widget.label),
        ),
        TextFormField(
          controller: widget.textController,
          autofocus: widget.authoFocus,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                color: AppPallete.authHintTextColor,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: (widget.obscureText)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child:(showPassword)? Icon(Icons.remove_red_eye_rounded, color: AppPallete.showPasswordEyeColor, size: 22,) : const Icon(Icons.visibility_off_outlined, color: AppPallete.showPasswordEyeColor, size: 22,),
                    )
                  : null),
          validator: (value) {
            if (value!.isEmpty) {
              return "${widget.hintText} is missing";
            }
            return null;
          },
          obscureText: showPassword,
          obscuringCharacter: '*',
        ),
      ],
    );
  }
}

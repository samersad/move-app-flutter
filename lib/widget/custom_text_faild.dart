import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:move/utils/app_color.dart';
import 'package:move/utils/app_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.isPassword,
    required this.controller,
    required this.icon,
  });

  final String hint;
  final bool isPassword;
  final Widget icon;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      style: AppFonts.regular20white,
      validator: (v) {
        if (v == null || v.isEmpty) {
          return 'Please fill ${widget.hint}';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: AppFonts.regular16white,
        filled: true,
        fillColor: AppColor.silver,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.silver),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColor.silver, width: 1.5),
        ),
        prefixIcon: widget.icon,
        suffixIcon: widget.isPassword
            ? InkWell(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText
                ? CupertinoIcons.eye_slash
                : CupertinoIcons.eye,
            color: AppColor.whait,
          ),
        )
            : null,
      ),
    );
  }
}

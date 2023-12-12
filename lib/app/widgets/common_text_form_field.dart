import 'package:flutter/material.dart';
import 'package:mobile_flutter_grounda/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final Function()? onSuffixIconPressed;
  final bool filled;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.validator,
    this.filled = true,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.textScaleFactorOf(context);

    return TextFormField(
      controller: controller,
      style: TextStyle(
          fontSize: 16 / h, color: filled ? Colors.black : Colors.white),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: filled
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              )
            : null,
        fillColor: kPrimaryColor,
        filled: filled,
        prefixIcon: filled ? Icon(prefixIcon) : null,
        suffixIcon: isPassword
            ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
      obscureText: obscureText,
      validator: validator,
    );
  }
}

import '../utils/style.dart';
import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String? s) validatorFunction;
  final bool isPassword;
  final IconData prefixIcon;
  final AutovalidateMode validateMode;
  final IconData? suffixIcon;
  final VoidCallback? suffixPressed;
  final bool autofocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String s)? onFieldSubmitted;
  const DefaultFormField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.validatorFunction,
    this.isPassword = false,
    required this.prefixIcon,
    this.suffixIcon,
    this.suffixPressed,
    this.autofocus = false,
    this.validateMode = AutovalidateMode.disabled,
    this.focusNode,
    this.onFieldSubmitted,
    this.textInputAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        autofocus: autofocus,
        focusNode: focusNode,
        textInputAction: textInputAction,
        autovalidateMode: validateMode,
        onFieldSubmitted: onFieldSubmitted,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          errorStyle: const TextStyle(
            color: errorColor,
          ),
          hintStyle: const TextStyle(fontSize: 13),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(30),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: errorColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: primaryColor,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffixIcon,
                    color: primaryColor,
                  ),
                )
              : null,
          hintText: hint,
        ),
        validator: validatorFunction,
      ),
    );
  }
}


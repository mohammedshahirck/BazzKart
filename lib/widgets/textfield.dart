import 'package:flutter/material.dart';

class TextsField extends StatelessWidget {
  const TextsField({
    Key? key,
    required this.hintText,
    required this.tiaction,
    this.isPassword = false,
    this.obscure = false,
    this.suffixOntap,
    this.controller,
    this.validator,
    this.readOnly = false,
    required this.keyboardType,
  }) : super(key: key);
  final String hintText;
  final bool isPassword;
  final bool obscure;
  final VoidCallback? suffixOntap;
  final TextEditingController? controller;
  final TextInputAction tiaction;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: tiaction,
      controller: controller,
      readOnly: readOnly,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(10.0, 30.0, 30.0, 10.0),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none, color: Colors.white),
        ),
        label: Text(hintText),
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
        suffixIcon: isPassword == true
            ? IconButton(
                onPressed: suffixOntap,
                icon: obscure == true
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
              )
            : null,
      ),
    );
  }
}

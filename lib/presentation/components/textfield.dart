import 'package:flutter/material.dart';

class PokeTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;

  const PokeTextField({
    Key key,
    this.controller,
    this.hint,
    this.obscureText = false,
  })  : assert(hint != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: hint,
        labelStyle: TextStyle(
          color: Colors.white60,
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white54,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
    );
  }
}

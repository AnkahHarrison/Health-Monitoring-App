import 'package:flutter/material.dart';
import 'package:health_app/utilities/colors.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObsureText;
  final IconData icon;

  const TextInputField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.isObsureText,
      required this.icon});


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObsureText,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        // suffixIcon: ,
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryClr),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryClr),
        ),
      ),
    );
  }
}


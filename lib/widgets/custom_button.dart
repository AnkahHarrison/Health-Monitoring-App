// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_app/screens/home_page.dart';
import 'package:health_app/screens/home_screen.dart';
// import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/utilities/colors.dart';

class CustomButton extends StatefulWidget {
  CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  final TextEditingController usernameController =
      TextEditingController(text: 'mark');
  final TextEditingController emailController =
      TextEditingController(text: 'mark@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: '123456');
  void _checkCredentials() {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (username == 'mark' &&
        email == 'mark@gmail.com' &&
        password == '123456') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } else {
      // Show an error message or handle invalid credentials here
      print('Invalid credentials');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width - 50,
      height: 50,
      child: ElevatedButton(
        onPressed: _checkCredentials,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryClr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // rounded corners
          ),
          // you can also specify other properties such as padding, elevation, etc.
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}

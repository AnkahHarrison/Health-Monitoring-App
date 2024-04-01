import 'package:flutter/material.dart';
import 'package:health_app/screens/home_page.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/utilities/colors.dart';
import '../widgets/text_input_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //todo FUNCTION FOR CONTROLLERS
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: primaryClr,
          dismissDirection: DismissDirection.startToEnd,
          behavior: SnackBarBehavior.floating,
          width: MediaQuery.sizeOf(context).width - 50,
          elevation: 0,
          content: const Text(
            'Invalid user credentials. please use UMaT credentials',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/umat.jpg',
              scale: 1.0,
              width: 150,
              height: 150,
            ),
            const Text(
              "Health Monitoring System",
              style: TextStyle(
                fontSize: 20,
                color: primaryClr,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: usernameController,
                icon: Icons.person,
                isObsureText: false,
                labelText: 'username',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: emailController,
                icon: Icons.email,
                isObsureText: false,
                labelText: 'email',
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextInputField(
                controller: passwordController,
                icon: Icons.lock,
                isObsureText: true,
                labelText: 'password',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
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
            ),
          ],
        ),
      ),
    );
  }
}

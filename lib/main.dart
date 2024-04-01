import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_app/screens/login_screen.dart';
import 'package:health_app/utilities/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          // statusBarColor: Colors.red,
          systemNavigationBarColor: primaryClr,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Color.fromARGB(255, 255, 255, 255)),
    );
    return MaterialApp(
      // title: 'Flutter Demo',
      // theme: ThemeData(
      //   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

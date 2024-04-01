import 'package:flutter/material.dart';
import 'package:health_app/screens/about_screen.dart';
import 'package:health_app/screens/profile_screen.dart';
import 'package:health_app/utilities/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: secondaryClr,
          ),
      // backgroundColor: primaryClr,
      drawer: Drawer(
        // backgroundColor: secondaryClr,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/umatcover.JPG'),
                  fit: BoxFit.cover,
                ),
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text(
                  "Eckintosh_Mark",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                accountEmail: Text(
                  "eckintosh@gmail.com",
                  style:
                      TextStyle(color: primaryClr, fontWeight: FontWeight.w500),
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.person,
                color: primaryClr,
                size: 18,
              ),
              title: Text('Profile'),
              onTap: () {
                // Add navigation functionality here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: primaryClr,
                size: 18,
              ),
              title: Text('About'),
              onTap: () {
                // Add navigation functionality here
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AboutScreen(),
                ));
              },
            ),
            // Add more ListTile widgets for additional drawer items
          ],
        ),
      ),
    );
  }
}

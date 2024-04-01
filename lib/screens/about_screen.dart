import 'package:flutter/material.dart';
import 'package:health_app/utilities/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: secondaryClr,
      child: const Center(
        child: AboutDialog(
          applicationName: 'Health Monitoring App',
          applicationVersion: '1.0.0',
          applicationLegalese: '© 2024 @ eckintosh',
          applicationIcon: Icon(
            Icons.favorite,
          ),
        ),
      ),
    );
  }
}

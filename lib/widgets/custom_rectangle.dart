// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:health_app/utilities/colors.dart';
import 'package:intl/intl.dart';

Widget buildHealthReadingContainer(
  String title,
  String reading,
) {
  String currentTime = DateFormat('HH:mm').format(DateTime.now());
  String currentDate = DateFormat('MMM dd, yyyy').format(DateTime.now());

  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
      border: Border.all(color: primaryClr),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          reading,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryClr,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Time: $currentTime',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Date: $currentDate',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

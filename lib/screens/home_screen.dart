import 'package:flutter/material.dart';
import 'package:health_app/utilities/colors.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        centerTitle: true,
        title: const Text(
          'HEALTH ANALYSIS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      20), // Set the border radius to create rounded corners
                  child: Image.asset(
                    'assets/fit.jpg', // Replace this with your image asset
                    width: MediaQuery.sizeOf(context).width -
                        50, // Set the width of the image
                    height: 110, // Set the height of the image
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // don't forget that the reading for showTemperatureModal equals buildHealthReadingContainer
                    showTemperatureModal(context, 35);
                  },
                  child: buildHealthReadingContainer('Temperature', '36.5°C',
                      Icons.thermostat_auto_rounded, 40, Colors.red),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    showHeartRateModal(context, 80);
                  },
                  child: buildHealthReadingContainer('Heart Rate', '80 bpm',
                      Icons.favorite_border_outlined, 40, Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showBloodOxygenModal(context, 75);
                  },
                  child: buildHealthReadingContainer(
                      'Blood Oxygen', '98%', Icons.bloodtype, 40, Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),

      // todo! Navigation Bar Here
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      //   selectedItemColor: primaryClr,
      //   // Add navigation functionality to switch between screens
      // ),
    );
  }

  Widget buildHealthReadingContainer(String title, String reading,
      IconData icon, double iconSize, Color iconsColor) {
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
          Icon(
            icon,
            color: iconsColor,
            size: iconSize,
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: primaryClr),
          ),
          const SizedBox(height: 0),
          Text(
            reading,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 0),
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

  void showTemperatureModal(BuildContext context, double temperature) {
    String status;
    double percentage;

    if (temperature >= 36.1 && temperature <= 37.2) {
      status = 'Normal';
      percentage = 0.5;
    } else if (temperature < 36.1) {
      status = 'Low';
      percentage = 0.3;
    } else {
      status = 'High';
      percentage = 0.7;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HealthStatusModal(
          title: 'Temperature',
          status: status,
          percentage: percentage,
        );
      },
    );
  }

  void showHeartRateModal(BuildContext context, int heartRate) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const HealthStatusModal(
          title: 'Heart Rate',
          status: 'Normal',
          percentage: 0.5,
        );
      },
    );
  }

  void showBloodOxygenModal(BuildContext context, int bloodOxygen) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return HealthStatusModal(
          title: 'Blood Oxygen',
          status: _getBloodOxygenStatus(bloodOxygen),
          percentage: _calculatePercentage(bloodOxygen),
        );
      },
    );
  }

  String _getBloodOxygenStatus(int bloodOxygen) {
    if (bloodOxygen >= 95) {
      return 'Normal';
    } else if (bloodOxygen >= 90) {
      return 'Low';
    } else {
      return 'Critical';
    }
  }

  double _calculatePercentage(int bloodOxygen) {
    return bloodOxygen / 100.0;
  }
}

class HealthStatusModal extends StatelessWidget {
  final String title;
  final String status;
  final double percentage;

  const HealthStatusModal(
      {super.key,
      required this.title,
      required this.status,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

// todo! for the dialog box details  START HERE
  contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: primaryClr),
          ),
          const SizedBox(height: 20),
          CircularPercentIndicator(
            animation: true,
            animationDuration: 1000,
            backgroundColor: Colors.amber,
            circularStrokeCap: CircularStrokeCap.round,
            radius: 120.0,
            lineWidth: 20.0,
            percent: percentage,
            center: Text(
              status,
              style: const TextStyle(fontSize: 30),
            ),
            // linearGradient: LinearGradient(
            //   colors: [
            //     Colors.red,
            //     Colors.purple,
            //     Colors.red,
            //     Colors.indigo,
            //     // Colors.red
            //   ],
            // ),
            progressColor: _getStatusColor(status),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.sizeOf(context).width - 50,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryClr,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // rounded corners
                ),
                // you can also specify other properties such as padding, elevation, etc.
              ),
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          )
        ],
      ),
    );
  }
// todo! for the dialog box details  ENDS HERE

// todo! for the VARIUOS COLORS METHOD  START HERE
  Color _getStatusColor(String status) {
    if (status == 'Normal') {
      return Colors.green;
    } else if (status == 'Low') {
      return Colors.blue;
    } else if (status == 'Critical') {
      return Colors.red;
    }
    return Colors.red;
  }
}

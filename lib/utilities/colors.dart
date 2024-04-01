import 'package:flutter/material.dart';

const Color primaryClr = Color(0xffff526a);
const Color secondaryClr = Color(0xff494848);

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


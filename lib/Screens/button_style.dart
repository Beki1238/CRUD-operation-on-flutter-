import 'package:flutter/material.dart';
ButtonStyle customButtonStyle() {
return ElevatedButton.styleFrom(
backgroundColor: Colors.green,
foregroundColor: Colors.white,
textStyle: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
);
}
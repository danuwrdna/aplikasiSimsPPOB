import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
  Widget bottomNavButton(String label, IconData icon, Function onTap, bool isActive) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? const Color.fromARGB(255, 20, 20, 20) : Colors.grey),
          Text(label, style: TextStyle(color: isActive ? const Color.fromARGB(255, 8, 8, 8) : Colors.grey)),
        ],
      ),
    );
  }

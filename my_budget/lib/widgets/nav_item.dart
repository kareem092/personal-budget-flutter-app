 import 'package:flutter/material.dart';

Widget navItem({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    bool active = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed:onPressed,
          icon:Icon(icon),
          color: active
              ? const Color(0xff003FB1)
              : Colors.grey,
              
        ),

        

        Text(
          label,
          style: TextStyle(
            color: active
                ? const Color(0xff003FB1)
                : Colors.grey,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

import 'package:flutter/material.dart';

Widget transactionsContainer({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffC3C5D7),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }
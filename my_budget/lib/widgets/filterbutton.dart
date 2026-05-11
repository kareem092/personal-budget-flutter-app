import 'package:flutter/material.dart';



class FilterButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const FilterButton({
    super.key, required this.title, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        
        onPressed: onPressed
        ,
        child: Text(title),
      ),
    );
  }
}
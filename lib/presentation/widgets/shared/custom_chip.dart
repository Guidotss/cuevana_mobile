import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label; 
  
  const CustomChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.yellow.shade800,
        height: 35,
        width: 80,
        child: TextButton(
          onPressed: () {},
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
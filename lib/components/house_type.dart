import 'package:flutter/material.dart';

class HouseType extends StatelessWidget {
  final String houseType;
  final bool isSelected;
  final VoidCallback onTap;

  const HouseType({
    super.key,
    required this.houseType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          houseType,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.blue : Colors.black,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTab,super.key,required this.label});
  final String label;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
             label,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProgressbarPerlindunganakun extends StatelessWidget {
  final double progress; 
  
  const ProgressbarPerlindunganakun({
    Key? key,
    this.progress = 0.6, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 14,
      decoration: BoxDecoration(
        color: Color(0xFFE2E5EA), 
        borderRadius: BorderRadius.circular(6), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFB88400), 
                  Color(0xFF3DC66C), 
                ],
              ),
              borderRadius: BorderRadius.circular(6), 
            ),
          ),
        ),
      ),
    );
  }
}
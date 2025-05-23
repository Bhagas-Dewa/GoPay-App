import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ButtonCekLain extends StatelessWidget {
  final String text;
  // final Widget? destinationPage;
  final VoidCallback? onTap;
  final Color textColor;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final double? height;
  final double? width;
  final double textSize;
  final FontWeight textWeight;

  const ButtonCekLain({
    Key? key,
    this.text = 'Cek 8 metode lain',
    // this.destinationPage,
    this.onTap,
    this.textColor = const Color(0xFF626E7A),
    this.iconColor = const Color(0XFF0A7F16),
    this.borderColor = const Color(0xFFEEEFF3),
    this.backgroundColor = Colors.white,
    this.height,
    this.width,
    this.textSize = 12,
    this.textWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 14, right: 6),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: textSize,
                color: textColor,
                fontWeight: textWeight,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_rounded, size: 18, color: iconColor),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ButtonLihatlainnya extends StatelessWidget {
  final String text;
  final String iconAssetPath;
  final Widget? destinationPage;
  final Color arrowColor;
  final double? height;
  final double? width;
  
  const ButtonLihatlainnya({
    Key? key,
    required this.text,
    required this.iconAssetPath,
    this.destinationPage,
    this.arrowColor = const Color(0XFF0A7F16),
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => destinationPage),
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Color(0xFFEEEFF3).withOpacity(0.3)],
            stops: [0.1, 1.0],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0xFFEEEFF3), width: 0.8),
        ),
        child: Row(
          children: [
            Image.asset(iconAssetPath, height: 18),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  letterSpacing: -0.3,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Icon(Icons.arrow_forward_rounded, size: 20, color: arrowColor),
          ],
        ),
      ),
    );
  }
}
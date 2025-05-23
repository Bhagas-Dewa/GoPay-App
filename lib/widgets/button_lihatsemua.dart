import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLihatsemua extends StatelessWidget {
  final VoidCallback onTap;
  ButtonLihatsemua({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 14, right: 6, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Color(0XFFF4FEF5),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Color(0XFF3DC66C).withOpacity(0.5), width: 1),
        ),
        child: Row(
          children: [
            Text(
              'Lihat semua',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward_rounded, color: Color(0XFF0A7F16), size: 18),
          ],
        ),
      ),
    );
  }
}

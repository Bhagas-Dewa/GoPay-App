import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XFFFFF8F9).withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          'Keluar',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.red,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}

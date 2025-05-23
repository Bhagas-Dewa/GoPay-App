import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TabviewAkunlainnya extends StatelessWidget {
  const TabviewAkunlainnya({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akun Lainnya',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 3),
          Text(
            'Kalo kamu udah transfer, kamu bisa lihat akunnya di sini.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.05,
            ),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DottedBorder(
                color: const Color(0xFFEDEDED),
                strokeWidth: 1,
                borderType: BorderType.Circle,
                dashPattern: [3, 3],
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFB7ECB6),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Image.asset('assets/avatar1.png', height: 34),
                    ),
                  ),
                ),
              ),
              DottedBorder(
                color: const Color(0xFFEDEDED),
                strokeWidth: 1,
                borderType: BorderType.Circle,
                dashPattern: [3, 3],
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFC0EEEC),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Image.asset('assets/avatar2.png', height: 34),
                    ),
                  ),
                ),
              ),
              DottedBorder(
                color: const Color(0xFFEDEDED),
                strokeWidth: 1,
                borderType: BorderType.Circle,
                dashPattern: [3, 3],
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFF2AA),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Image.asset('assets/avatar3.png', height: 34),
                    ),
                  ),
                ),
              ),
              DottedBorder(
                color: const Color(0xFFEDEDED),
                strokeWidth: 1,
                borderType: BorderType.Circle,
                dashPattern: [3, 3],
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFF7D2E1),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Center(
                      child: Image.asset('assets/avatar4.png', height: 34),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/circle_plusperson.png'),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/circle_plusperson.png'),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/circle_plusperson.png'),
              ),
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/circle_plusperson.png'),
              ),
            ],
          ),
          SizedBox(height: 15),
        ],
      ),
      
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GopayAman extends StatelessWidget {
  const GopayAman({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 18),
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/gopay_aman.png', height: 40),
              Container(
                padding: EdgeInsets.only(left: 12, right: 6, top: 7, bottom: 7),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFE2E5EA).withOpacity(0.1),
                      Color(0xFF3DC66C).withOpacity(0.15),
                    ],
                    stops: [0.01, 0.4],
                  ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Color(0XFF3DC66C).withOpacity(0.5),
                    width: 0.8,
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Pelajari',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.03,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0XFF0A7F16),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Color(0xFFEEEFF3), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset('assets/gopayaman_icon1.png', height: 30),
                    SizedBox(height: 5),
                    Text(
                      'Fitur\nkeamanan\nakun',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/gopayaman_icon2.png', height: 30),
                    SizedBox(height: 5),
                    Text(
                      'Customer\nService 24\njam',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/gopayaman_icon3.png', height: 30),
                    SizedBox(height: 5),
                    Text(
                      'Jaminan\nSaldo\nKembali',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/gopayaman_icon4.png', height: 30),
                    SizedBox(height: 5),
                    Text(
                      'Privasi &\nproteksi\ndata',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

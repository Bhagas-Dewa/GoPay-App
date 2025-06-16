import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';

class QrMinta extends StatelessWidget {
  const QrMinta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        title: 'Minta Lewat QR',
        rightIcon: Icon(Icons.help_rounded, color: Colors.black, size: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20), 
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3), 
                  spreadRadius: 3, 
                  blurRadius: 8, 
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Color(0xFFF4F6F5),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Minta temenmu scan kode QR ini dari aplikasi GoPay atau Gojek',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Color(0XFF3DC66C).withOpacity(0.4),
                              width: 1,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0XFF3DC66C).withOpacity(0.3),
                                Color(0XFF01AED6).withOpacity(0.3),
                              ],
                              stops: [0.1, 0.7],
                            ),
                          ),
                          child: Image.asset(
                            'assets/kode_qr.png',
                            height: 220,
                            width: 220,
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),  
                  Container(
                    color: Color(0xFFFDFDFD), 
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                          ),
                          child: Text(
                            'B',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bhagas',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              '+62851******0882',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset('assets/logo_gopay1.png', height: 28),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFF5DB466), Color(0XFF088C15)],
              stops: [0.2, 1.0],
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            'Bagiin kode',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Colors.white,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
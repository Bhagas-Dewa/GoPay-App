import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/button_logout.dart';

class PengaturanNilai extends StatelessWidget {
  PengaturanNilai({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Pesan sponsor dari',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(width: 8),
            Image.asset('assets/logo_gopay.png', height: 14),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          'Apa pun impianmu, kami siap bantuin kamu jadi jago atur keuangan dan tabungan. Yuk, #FinanSiap bareng GoPay!',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: const Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Color(0xFFEEFFED)],
              stops: [0.1, 0.5],
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            'Beri kami nilai',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0XFF0A7F16),
              letterSpacing: -0.3,
            ),
          ),
        ),
        SizedBox(height: 30),
        Text(
          'Ikuti kami di:',
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),

        SizedBox(height: 10),

        Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: inset.BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  inset.BoxShadow(
                    inset: true,
                    offset: Offset(0, 5),
                    blurRadius: 4,
                    color: Color(0xFFC0C5C9).withOpacity(0.4),
                  ),
                ],
              ),
              child: Image.asset('assets/logo_facebook.png', height: 15),
            ),
            SizedBox(width: 15),
            Container(
              padding: EdgeInsets.all(20),
              decoration: inset.BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  inset.BoxShadow(
                    inset: true,
                    offset: Offset(0, 5),
                    blurRadius: 4,
                    color: Color(0xFFC0C5C9).withOpacity(0.4),
                  ),
                ],
              ),
              child: Image.asset('assets/logo_instagram.png', height: 15),
            ),
            SizedBox(width: 15),
            Container(
              padding: EdgeInsets.all(20),
              decoration: inset.BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  inset.BoxShadow(
                    inset: true,
                    offset: Offset(0, 5),
                    blurRadius: 4,
                    color: Color(0xFFC0C5C9).withOpacity(0.4),
                  ),
                ],
              ),
              child: Image.asset('assets/logo_twitter.png', height: 15),
            ),
          ],
        ),

        SizedBox(height: 20),
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A), 
              letterSpacing: -0.3,
            ),
            children: [
              TextSpan(text: 'Versi '),
              TextSpan(
                text: '1.45.0',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF626E7A), 
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        //button logout
        ButtonLogout(),
      ],
    );
  }
}

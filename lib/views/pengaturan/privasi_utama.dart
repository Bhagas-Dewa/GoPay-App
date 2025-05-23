import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivasiUtama extends StatelessWidget {
  const PrivasiUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 18),
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privasimu yang paling utama',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Kami menjaga keamanan data pribadi, kartu & transaksi kamu dan tidak akan disebar ke mana pun.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 25),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
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
                Image.asset('assets/pengaturan_iconprivasi.png', height: 20),
                SizedBox(width: 8),
                Text(
                  'Cek gimana kami melindungi datamu',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: -0.3,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                  color: Color(0XFF0A7F16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

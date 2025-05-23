import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengaturanProfile extends StatelessWidget {
  const PengaturanProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              'assets/pengaturan_photoprofile.png',
              height: 60,
              width: 60,
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bhagas',
                  style: GoogleFonts.lora(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    letterSpacing: -0.1,
                  ),
                ),
                Text(
                  '+6281234567891',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.1,
                  ),
                ),
                Text(
                  'bhagasmantap@gmail.com',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.1,
                  ),
                ),
                Text(
                  'Verifikasi',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF088C15),
                    letterSpacing: -0.1,
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF088C15),
                  ),
                ),
                Text(
                  'Ganti profil',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF088C15),
                    letterSpacing: -0.1,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFEDEDED), width: 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/icon_qr.png',
                      height: 18,
                      width: 18,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'QR Ku',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    height: 1.15,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

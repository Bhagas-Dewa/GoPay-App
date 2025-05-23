import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PengaturanControl extends StatelessWidget {
  const PengaturanControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.settings,
                      size: 24, 
                      color: Color(0xFF626E7A)
                    ),
                    Container(
                      height: 30,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pengaturan akun & aplikasi',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Kontrol pengaturan aplikasi, data, aplikasi\nterhubung, dan lainnya.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Color(0xFFC0C5C9),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 54),
            child: Divider(
              color: Color(0xFFEEEFF3),
              thickness: 1,
              height: 30,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.clean_hands_rounded,
                      size: 24, 
                      color: Color(0xFF626E7A)
                    ),
                    Container(
                      height: 8,
                      color: Colors.transparent,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bantuan',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.1,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Kirim dan pantau laporanmu di sini.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Color(0xFFC0C5C9),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

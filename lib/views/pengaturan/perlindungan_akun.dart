import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/progressbar_perlindunganakun.dart';

class PerlindunganAkun extends StatelessWidget {
  const PerlindunganAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 275,
          decoration: BoxDecoration(
            color: Color(0XFFE2E5EA),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 68),
                Text(
                  'Dilindungi oleh',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(width: 4),
                Image.asset(
                  'assets/pengaturan_gopayaman.png',
                  height: 18,
                  width: 40,
                ),
                SizedBox(width: 95),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        // Container kecil (depan) diposisikan di atas
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Perlindungan akun',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Image.asset('assets/pengaturan_protect.png', height: 50),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '60%',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Nanggung, tambah lagi!',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ProgressbarPerlindunganakun(progress: 0.6),
                  ),

                  Text(
                    'Tambah proteksi ekstra buat keamanan ekstra setiap saat. Semangat!',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.5,
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 6),
                    child: Container(
                      padding: EdgeInsets.only(top: 6, bottom: 6, left: 14, right: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0XFFE2E5EA).withOpacity(0.1),
                            Color(0xFF3DC66C).withOpacity(0.1),
                          ],
                          stops: [0.1, 0.4],
                        ),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0XFF3DC66C).withOpacity(0.5),
                          width: 0.8,
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/pengaturan_protect3.png',
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Perkuat perlindunganmu di sini',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF0A7F16),
                              letterSpacing: -0.3,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 18,
                            color: Color(0XFF0A7F16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

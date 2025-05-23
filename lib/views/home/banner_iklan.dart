import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/balance_card/balance_card.dart';
import 'package:gopay_task/widgets/bottomcurve_clipper.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';

class BannerIklan extends StatelessWidget {
  const BannerIklan({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: BottomCurveClipper(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0XFFFDFDFD),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Klaim 150rb kamu sekarang!',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF000000),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 14,
                            right: 6,
                            top: 5,
                            bottom: 5,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF7AE39A).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: const Color(0XFF0A7F16),
                              width: 0.8,
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Mulai',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0XFF0A7F16),
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                   Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, bottom: 4, top: 10),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Ada hadiah GoPay Saldo s.d. 150.000 buat kamu. Buruan dapetin sebelum kehabisan! ',
                          ),
                          TextSpan(
                            text: 'Ayo dapetin sekarang!',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0XFF088C15),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Image.asset('assets/banner_iklan.png')
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: BottomCurveBorderPainter(),
          ),
        ),
      ],
    );
  }
}

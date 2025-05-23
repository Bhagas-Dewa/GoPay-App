
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/pembayaran/detail_pembayaran.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';
import 'package:gopay_task/widgets/dottedline_curve.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0XFFFDFDFD),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            // left: 20,
            // right: 20,
            top: 12,
            bottom: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pembayaran',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    ButtonLihatsemua(
                      onTap: () => Get.to(() => DetailPembayaran()),
                    ),
                  ],
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/pembayaran_pulsa1.png',
                          height: 24,
                          width: 24,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pulsa termurah',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Pulsa 15rb harga Rp9.900',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Promo terbatas',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF3DC66C), Color(0xFF088C15)],
                          stops: [0.3, 1.0],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Beli',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DottedLineWithCurves(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pembayaran_pulsa1.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -3,
                              child: Image.asset(
                                'assets/label_murah.png',
                                height: 50,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Pulsa',
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
      
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pembayaran_pln.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -3,
                              child: Image.asset(
                                'assets/label_murah.png',
                                height: 50,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'PLN',
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
      
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pembayaran_data1.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -3,
                              child: Image.asset(
                                'assets/label_murah.png',
                                height: 50,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Paket Data',
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
      
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/pembayaran_emoney.png',
                              height: 42,
                              width: 42,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Top up e\n-money',
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
      
              Padding(
                padding: const EdgeInsets.only(right: 28, left: 20, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/pembayaran_googleplay.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Promo Google\nPlay',
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
      
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pembayaran_game.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -3,
                              child: Image.asset(
                                'assets/label_murah.png',
                                height: 50,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Topup Game',
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
      
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/pembayaran_tagihan.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Promo Bayar\nTagihan',
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
                    Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Color(0xFFEDEDED),
                                  width: 1,
                                ),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/pembayaran_gofood.png',
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -20,
                              right: -3,
                              child: Image.asset(
                                'assets/label_murah.png',
                                height: 50,
                                width: 60,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(
                          'GoFood',
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
            ],
          ),
        ),
      ),
    );
  }
}



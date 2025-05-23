import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;

class QrisUnlimited extends StatelessWidget {
  const QrisUnlimited({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    color: Color(0XFF01AED6),
                    child: Column(
                      children: [
                        SizedBox(height: 45),
                        Image.asset(
                          'assets/illustrator_qris_unlimited.png',
                          height: 170,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 22,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0XFF01AED6),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/qris-white.png',
                                  height: 8,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                'QRIS Unlimited',
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: -0.3,
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.only(
                                  left: 6,
                                  right: 7,
                                  top: 4,
                                  bottom: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0XFF91328E),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Colors.white,
                                      ),
                                      child: Icon(
                                        Icons.verified_rounded,
                                        color: Color(0XFF91328E),
                                        size: 14,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      'Aktif',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    color: Color(0xFFEEEFF3),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lebih lanjut soal QRIS Unlimited',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(height: 15),

                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/qris_unlimited_chest.png',
                                    height: 24,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'Kamu bisa dapetin benefit ini!',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 25,
                                ),
                                decoration: inset.BoxDecoration(
                                  color: Color(0xFFEEEFF3),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    inset.BoxShadow(
                                      inset: true,
                                      offset: Offset(0.5, 2),
                                      blurRadius: 4,
                                      color: Color(0xFFC0C5C9).withOpacity(0.4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_coins.png',
                                          height: 24,
                                        ),
                                        SizedBox(width: 14),
                                        Text(
                                          'Dapetin GoPay coins di tiap transaksi',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_barcode.png',
                                          height: 24,
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          'Berlaku di semua QRIS rekan usaha',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 18),

                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 20,
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/qris_unlimited_dompet.png',
                                    height: 26,
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    'Gini cara dapetin cashbacknya',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 25,
                                ),
                                decoration: inset.BoxDecoration(
                                  color: Color(0xFFEEEFF3),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    inset.BoxShadow(
                                      inset: true,
                                      offset: Offset(0.5, 2),
                                      blurRadius: 4,
                                      color: Color(0xFFC0C5C9).withOpacity(0.4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_scan.png',
                                          height: 26,
                                        ),
                                        SizedBox(width: 11),
                                        Text(
                                          'Scan kode QRIS rekan usaha',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_hpotomatis.png',
                                          height: 26,
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'QRIS unlimited terpasang otomatis',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_hand.png',
                                          height: 26,
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'Selesaikan pembayaran',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/qris_unlimited_cashbackcoin.png',
                                          height: 26,
                                        ),
                                        SizedBox(width: 15),
                                        Text(
                                          'Terima cashbak GoPay coins-nya',
                                          style: GoogleFonts.inter(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0XFF626E7A),
                                            letterSpacing: -0.3,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 12,
              left: 20,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                  ),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

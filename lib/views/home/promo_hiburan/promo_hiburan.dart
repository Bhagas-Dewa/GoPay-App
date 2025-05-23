import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/promo_hiburan/detail_promo_hiburan.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';

class PromoHiburan extends StatelessWidget {
  const PromoHiburan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFDFDFD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 12,
            bottom: 8,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Promo & hiburan',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    ButtonLihatsemua(
                      onTap: () => Get.to(() => DetailPromoHiburan()),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 4,
                ),
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
                              'assets/promo_kartugosok.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Kartu Gosok',
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
                              'assets/pomo_vouchersaya.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Voucher Saya',
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
                              'assets/promo_tagihan.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Tagihan &\nPulsa promos',
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
                              'assets/promo_reward.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'A+ Rewards',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              'assets/promo_kebutuhan.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Kebutuhan\nharian',
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
                    SizedBox(width: 10),
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
                              'assets/promo_populer.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Brand populer',
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
                    SizedBox(width: 6),
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
                              'assets/promo_game.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Promo game',
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/riwayat_transaksi/detail_riwayat_transaksi_.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';

class RiwayatTransaksi extends StatelessWidget {
  const RiwayatTransaksi({super.key});

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
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Riwayat transaksi',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    ButtonLihatsemua(
                      onTap: () => Get.to(() => DetailRiwayatTransaksi()),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/riwayat_pulsabill.png',
                              height: 16,
                              width: 16,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: -5,
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Image.asset(
                                'assets/riwayat_labelpulsa.png',
                                height: 14,
                                width: 14,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GoPulsa - SIMPATI',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            height: 1.15,
                          ),
                        ),
                        Text(
                          '25.000 - 081234567899',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-Rp19.900',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Gopay Saldo',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                            ), SizedBox(width: 4),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0XFF01AED6),
                              child: Image.asset(
                                'assets/logo_onboarding.png',
                                height: 10,
                                width: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 77),
                child: Divider(
                  color: Color(0xFFEEEFF3),
                  thickness: 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Color(0XFFDFF6FB),
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(
                          color: Color(0xFFEDEDED),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/riwayat_plus.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'GoPay Top Up',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -0.3,
                        height: 1.15,
                      ),
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Rp20.000',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF088C15),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Gopay Saldo',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                            ), SizedBox(width: 4),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0XFF01AED6),
                              child: Image.asset(
                                'assets/logo_onboarding.png',
                                height: 10,
                                width: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 77),
                child: Divider(
                  color: Color(0xFFEEEFF3),
                  thickness: 2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 42,
                          width: 42,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/riwayat_ride.png',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -3,
                          right: -5,
                          child: Container(
                            height: 20,
                            width: 20,
                            child: Center(
                              child: Image.asset(
                                'assets/riwayat_labelride.png',
                                height: 14,
                                width: 14,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Taman Jemursari',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            height: 1.15,
                          ),
                        ),
                        Text(
                          'Selatan I No.5a',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            height: 1.15,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '-Rp15.000',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Gopay Saldo',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                            ), SizedBox(width: 4),
                            CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0XFF01AED6),
                              child: Image.asset(
                                'assets/logo_onboarding.png',
                                height: 10,
                                width: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
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

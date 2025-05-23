import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/layanan_fav_warga/detail_layananfav_warga.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';

class LayananFavWarga extends StatelessWidget {
  const LayananFavWarga({super.key});

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
                      'Layanan favorit warga',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    ButtonLihatsemua(
                      onTap: () => Get.to(()=> DetailLayananfavWarga()),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, bottom: 4, top: 10),
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
                              'assets/layananfav_gopaydash.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'GoPay Dash',
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
                              'assets/layananfav_joliboxgame.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Jolibox\nGames',
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
                              'assets/layananfav_joliboxvid.png',
                              height: 35,
                              width: 35,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Jolibox drama',
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
                              'assets/layananfav_educa.png',
                              height: 30,
                              width: 30,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Educa Studio',
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

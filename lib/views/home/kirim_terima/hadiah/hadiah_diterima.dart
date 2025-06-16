import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/bantuan/bantuan_page.dart';

class HadiahDiterima extends StatelessWidget {
  const HadiahDiterima({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        children: [

          Positioned(
            top: 90,
            left: 20,
            right: 20,
            child: Column(
              children: [
                Text(
                  'Dapet hadiah dari GoPay Indonesia',
                  style: GoogleFonts.lora(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                    height: 1.15,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, size: 20, color: Color(0xFF626E7A).withOpacity(0.5)),
                    SizedBox(width: 5),
                    Text(
                      'Hangus pada',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '26 Maret',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Image.asset('assets/sticket_angpao_abu.png', height: 450)
              ],
            ),
          ),

          Positioned(
            top: 32,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_rounded, size: 24),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(() => BantuanPage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.help_rounded, size: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

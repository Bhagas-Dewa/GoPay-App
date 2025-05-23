import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/promo_hiburan/tabview_eksplor.dart';

class TabviewBelivoucher extends StatelessWidget {
  const TabviewBelivoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/banner_belivoucher.png',
            height: 250,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 25),
          Text(
            'Paket voucher baru lagi disiapin',
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF000000),
              letterSpacing: -0.1,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Sembari nunggu, cek dulu promo lain yang lagi berlangsung, yuk!',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              TabviewEksplor();
            } ,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Text(
                'Cek promo lain',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

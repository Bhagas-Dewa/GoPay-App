import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/home.dart';
import 'package:gopay_task/views/login/start_page.dart';

class OnboardingSplash extends StatelessWidget {
  const OnboardingSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01AED6),
      body: GestureDetector(
        onTap: () {
          Get.offAll(()=> StartPage());
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo_onboarding.png',
                width: 100,
                height: 100,
              ),
              Text(
                "gopay",
                style: GoogleFonts.inter(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

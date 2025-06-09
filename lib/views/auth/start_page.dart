import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/auth/login_page.dart';
import 'package:gopay_task/views/auth/register_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFDFDFD),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFFFDFDFD),
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 220, right: 20, top: 22),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(color: Color(0xFFEEEFF3), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.translate_rounded, size: 18),
                  Text(
                    'Bahasa Indonesia',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang di GoPay!',
              style: GoogleFonts.lora(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Masuk atau daftar hanya dalam beberapa langkah mudah.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 20),
            _buildButtonLogin(),
            SizedBox(height: 15),
            _buildAtau(),
            SizedBox(height: 15),
            _buildButtonRegister(),
            SizedBox(height: 20),
            _buildTextSnK(),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'from',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(width: 5),
                Image.asset('assets/logo_goto.png', height: 12),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonLogin() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> LoginPage());
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0XFF5DB466), Color(0XFF088C15)],
            stops: [0.2, 1.0],
          ),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          'Login',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAtau() {
    return Row(
      children: [
        Container(height: 1, width: 145, color: Color(0xFFEEEFF3)),
        SizedBox(width: 15),
        Text(
          'atau',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(width: 15),
        Container(height: 1, width: 145, color: Color(0xFFEEEFF3)),
      ],
    );
  }

  Widget _buildButtonRegister() {
    return GestureDetector(
      onTap: () => Get.to(() => RegisterPage()),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Color(0XFF088C15), width: 1.5),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          'Lanjut dengan Akun lain',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Color(0XFF088C15),
            letterSpacing: -0.3,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTextSnK() {
    return Text.rich(
      TextSpan(
        text: 'Saya menyetujui ',
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFF626E7A),
          letterSpacing: -0.3,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Ketentuan Layanan ',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0XFF088C15),
              letterSpacing: -0.3,
              decoration: TextDecoration.underline,
              decorationColor: Color(0XFF088C15),
            ),
          ),
          TextSpan(text: '& '),
          TextSpan(
            text: 'Kebijakan Privasi ',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0XFF088C15),
              letterSpacing: -0.3,
              decoration: TextDecoration.underline,
              decorationColor: Color(0XFF088C15),
            ),
          ),
          TextSpan(text: 'GoPay.'),
        ],
      ),
    );
  }
}

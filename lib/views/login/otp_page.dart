import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/views/login/create_name_page.dart';
import 'package:gopay_task/views/login/create_pin_page.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppBar(
        backgroundColor: Color(0xFFEEEFF3),
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 15,
              bottom: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.help_outlined,
                    color: Color.fromARGB(255, 61, 61, 61),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          Text(
            'Cek Gmail, ya!',
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Kodenya kami kirim ke alamat email yang kamu daftarkan. Silakan cek kotak masuk atau folder spam.',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'OTP*',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 10),
          _buildTextField(),
          SizedBox(height: 15),
          Obx(() => Row(
            children: [
              GestureDetector(
                onTap: authController.resendOtp,
                child: Text(
                  'Kirim ulang?',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: authController.canResend.value 
                        ? Color(0XFF088C15) 
                        : Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    decoration: authController.canResend.value 
                        ? TextDecoration.underline 
                        : TextDecoration.none,
                    decorationColor: authController.canResend.value 
                        ? Color(0XFF088C15) 
                        : null,
                  ),
                ),
              ),
              SizedBox(width: 5),
              Text(
                authController.canResend.value 
                    ? '' 
                    : authController.formatTime(authController.countdown.value),
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          )),
          SizedBox(height: 450),
          GestureDetector(
            onTap: () {
              Get.to(()=> CreateNamePage());
            },
            child: Row(
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
          ),
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFEEEFF3), width: 1),
          ),
          child: Image.asset('assets/logo_gmail.png', width: 18, height: 18),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
            ),
            cursorColor: Color(0XFF088C15),
            decoration: InputDecoration(
              hintText: '•••••••',
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                letterSpacing: -0.3,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF626E7A), width: 0.5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0XFF088C15), width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 5),
              isDense: true,
            ),
            keyboardType: TextInputType.number,
            maxLength: 6,
          ),
        ),
      ],
    );
  }
}
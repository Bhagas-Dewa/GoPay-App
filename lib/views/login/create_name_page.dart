import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/views/login/create_pin_page.dart';

class CreateNamePage extends StatelessWidget {
  CreateNamePage({super.key});
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
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
            'Isi data diri dulu, ya',
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Nama*',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 10),
          _buildTextField(),
          SizedBox(height: 15),
         
          SizedBox(height: 490),
          _buildButtonLanjut(),
          SizedBox(height: 15),
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
        ],
      ),
    );
  }

  Widget _buildTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
            cursorColor: Color(0XFF088C15),
            decoration: InputDecoration(
              hintText: 'Ketik nama kamu disni',
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
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLanjut() {
    return GestureDetector(
      onTap: () {
        Get.to(() => CreatePinPage());
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
          'Lanjut',
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
}
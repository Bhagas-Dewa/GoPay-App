import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/views/login/otp_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    authController.clearEmailInput();
  }

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
                Spacer(),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.help_outlined,
                    color: Color.fromARGB(255, 61, 61, 61),
                    size: 18,
                  ),
                ),
                SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.translate_rounded, size: 18),
                      SizedBox(width: 5),
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
              ],
            ),
          ),
        ),
      ),
      body: Obx(() {
        // Bungkus dengan Obx untuk isLoading
        if (authController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: Color(0xFF088C15)),
          );
        }
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              'Segera Daftar hanya dalam beberapa langkah mudah.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Alamat Email*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 10),
            _buildTextField(),
            SizedBox(height: 420),
            _buildButtonLanjut(),
            SizedBox(height: 15),
            _buildTextSnK(),
            SizedBox(height: 20),
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
        );
      }),
    );
  }

  Widget _buildTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
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
            controller: authController.emailController,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Color(0xFF626E7A),
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
            ),
            cursorColor: Color(0XFF088C15),
            decoration: InputDecoration(
              hintText: 'Masukkan alamat email Anda',
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                letterSpacing: -0.3,
                color: Color(0xFF626E7A).withOpacity(0.7),
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
            keyboardType: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLanjut() {
    return Obx(
      () => GestureDetector(
        onTap:
            authController.isLoading.value
                ? null
                : () {
                  authController.checkEmailRegister();
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
          child:
              authController.isLoading.value
                  ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                  : Text(
                    'Daftar',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
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

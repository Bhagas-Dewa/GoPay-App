import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/views/auth/create_pin_page.dart';

class CreateNamePage extends StatefulWidget {
  CreateNamePage({super.key});

  @override
  State<CreateNamePage> createState() => _CreateNamePageState();
}

class _CreateNamePageState extends State<CreateNamePage> {
  final AuthController authController = Get.find<AuthController>();

   @override
  void initState() {
    super.initState();
    authController.clearNameInput();
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
      body: Obx(() { // Bungkus dengan Obx untuk isLoading
        if (authController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Color(0xFF088C15)));
        }
        return ListView(
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.55),
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
            SizedBox(height: 20),
          ],
        );
      }),
    );
  }

  Widget _buildTextField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextField(
            controller: authController.nameController,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.3,
            ),
            cursorColor: Color(0XFF088C15),
            decoration: InputDecoration(
              hintText: 'Ketik nama kamu disini',
              hintStyle: GoogleFonts.inter(
                fontSize: 14,
                letterSpacing: -0.3,
                color: Colors.black.withOpacity(0.6),
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
            keyboardType: TextInputType.name,
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLanjut() {
    return GestureDetector(
      onTap: authController.isLoading.value
            ? null 
            : () {
                authController.setUserName();
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
        child: authController.isLoading.value
            ? SizedBox( 
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
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
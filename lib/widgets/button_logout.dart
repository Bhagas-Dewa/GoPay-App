// lib/widgets/button_logout.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart'; // Import AuthController
// import 'package:gopay_task/views/login/start_page.dart'; // Navigasi sudah dihandle AuthController

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({super.key});

  @override
  Widget build(BuildContext context) {
    // Dapatkan instance AuthController
    final AuthController authController = Get.find<AuthController>();

    return GestureDetector(
      onTap: authController.isLoading.value 
          ? null // Jangan lakukan apa-apa jika sedang loading
          : () {
              // Panggil method logout dari AuthController
              authController.logout();
            },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0XFFFFF8F9).withOpacity(0.7),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          // Gunakan Obx untuk membuat child reaktif terhadap isLoading
          child: Obx(() {
            if (authController.isLoading.value) {
              // Tampilkan loading indicator jika sedang proses logout
              return SizedBox(
                height: 20, // Sesuaikan ukuran jika perlu
                width: 20,  // Sesuaikan ukuran jika perlu
                child: CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              );
            } else {
              // Tampilkan teks "Keluar" jika tidak sedang loading
              return Text(
                'Keluar',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  letterSpacing: -0.3,
                ),
              );
            }
          }),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset; // Pastikan alias 'inset' digunakan
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';

class PinLoginPage extends StatefulWidget {
  const PinLoginPage({super.key});

  @override
  State<PinLoginPage> createState() => _PinLoginPageState();
}

class _PinLoginPageState extends State<PinLoginPage> {
  final AuthController authController = Get.find<AuthController>();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    authController.clearPinLoginInput();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_pinFocusNode);
    });
  }

  @override
  void dispose() {
    _pinFocusNode.dispose();
    super.dispose();
  }
  void _onPinChanged(String value) {
    if (value.length == AuthController.maxPinLength) {
      if (!authController.isLoading.value) { 
         authController.loginWithPin();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        backgroundColor: const Color(0xFFEEEFF3),
        title: 'Masukkan PIN kamu',
        rightIcon: GestureDetector(
          onTap: () {
            Get.snackbar("Bantuan", "Halaman bantuan belum tersedia.", snackPosition: SnackPosition.BOTTOM);
          },
          child: Icon(
            Icons.help_outlined,
            color: const Color.fromARGB(255, 61, 61, 61),
            size: 24,
          ),
        )
      ),
      body: Obx(() { 
        if (authController.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Color(0xFF088C15)));
        }
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          children: [
            Text(
              'Silahkan ketik 6 digit PIN kamu buat lanjut.',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 15),
            _buildPinWidget(), 
            SizedBox(height: 20),
            _buildButtonLupaPin(),
          ],
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'powered by',
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
    );
  }

  Widget _buildPinWidget() { 
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFDFDFD),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 70,
            decoration: inset.BoxDecoration( 
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFFE5E6E8), Color(0xFFEEEFF3)],
                stops: [0.3, 0.9],
              ),
              boxShadow: [
                inset.BoxShadow(
                  inset: true,
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Color(0xFFC0C5C9).withOpacity(0.4),
                ),
              ],
            ),
            child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(AuthController.maxPinLength, (index) {
                bool isFilled = index < authController.pinForUIDisplay.value.length; 
                return Container(
                  margin: EdgeInsets.only(right: index < AuthController.maxPinLength - 1 ? 20 : 0),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isFilled ? Color(0xFF088C15) : Color(0xFF626E7A),
                      width: 1.5,
                    ),
                    color: isFilled ? Color(0xFF088C15) : Colors.transparent,
                  ),
                );
              }),
            )),
          ),
          Positioned.fill(
            child: TextField(
              controller: authController.pinInputController,
              focusNode: _pinFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(AuthController.maxPinLength),
              ],
              obscureText: true,
              obscuringCharacter: '●',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.transparent, fontSize: 1),
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
              cursorColor: Colors.transparent,
              showCursor: false,
              onChanged: _onPinChanged, 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonLupaPin() {
    return Padding(
      padding: const EdgeInsets.only(right: 241),
      child: GestureDetector(
        onTap: () {
          Get.snackbar('Info', 'Fitur Lupa PIN belum diimplementasikan.', snackPosition: SnackPosition.BOTTOM);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: Color(0XFFF4FEF5),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color(0XFF3DC66C).withOpacity(0.5),
              width: 1,
            ),
          ),
          child: Text(
            'Lupa PIN',
            style: GoogleFonts.lora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF088C15),
              letterSpacing: -0.1,
            ),
          ),
        ),
      ),
    );
  }
}
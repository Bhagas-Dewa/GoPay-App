import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
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
  final TextEditingController _textController = TextEditingController();
  final FocusNode _pinFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Clear PIN data when entering create PIN page
    authController.clearPinData();

    // Auto focus pada input PIN
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pinFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _pinFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        backgroundColor: const Color(0xFFEEEFF3),
        title: 'Masukkan PIN kamu',
        rightIcon: Icon(
          Icons.help_outlined,
          color: const Color.fromARGB(255, 61, 61, 61),
          size: 24,
        ),
      ),
      body: ListView(
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
          _buildPin(),
          SizedBox(height: 20),
          _buildButtonLupaPin(),
        ],
      ),
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

  Widget _buildPin() {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // PIN Dots Display
                Obx(
                  () => Row(
                    children: List.generate(6, (index) {
                      bool isFilled = authController.isPinDotFilled(index);
                      return Container(
                        margin: EdgeInsets.only(right: index < 5 ? 20 : 0),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color:
                                isFilled
                                    ? Color(0xFF088C15)
                                    : Color(0xFF626E7A),
                            width: 1.5,
                          ),
                          color:
                              isFilled
                                  ? (authController.isPinObscured.value
                                      ? Color(0xFF088C15)
                                      : Colors.transparent)
                                  : Colors.transparent,
                        ),
                        child:
                            authController.isPinObscured.value && isFilled
                                ? null
                                : Center(
                                  child: Text(
                                    authController.getPinDigit(index),
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF088C15),
                                    ),
                                  ),
                                ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // Invisible TextField for input
          Positioned.fill(
            child: TextField(
              controller: _textController,
              focusNode: _pinFocusNode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6),
              ],
              obscureText: false,
              style: TextStyle(color: Colors.transparent),
              decoration: InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              cursorColor: Colors.transparent,
              showCursor: false,
              onChanged: (value) {
                authController.updatePin(value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonLupaPin() {
    return Padding(
      padding: const EdgeInsets.only(right: 241),
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
    );
  }
}

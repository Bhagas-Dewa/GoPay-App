import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/home.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';
import 'package:gopay_task/controllers/auth_controller.dart'; // Import AuthController

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  // Get existing AuthController instance atau create baru jika belum ada
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
        title: 'Pasang Pin',
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
            'PIN bikin bayar-bayar dan log in jadi lebih aman. Pilih PIN yang unik dan jangan dibagiin ke siapapun.',
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
          _buildTipsAman(),
          SizedBox(height: 290),
          _buildButtonLanjut(),
        ],
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
                Obx(() => Row(
                  children: List.generate(6, (index) {
                    bool isFilled = authController.isPinDotFilled(index);
                    return Container(
                      margin: EdgeInsets.only(right: index < 5 ? 20 : 0),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isFilled 
                            ? Color(0xFF088C15) 
                            : Color(0xFF626E7A), 
                          width: 1.5
                        ),
                        color: isFilled 
                          ? (authController.isPinObscured.value ? Color(0xFF088C15) : Colors.transparent)
                          : Colors.transparent,
                      ),
                      child: authController.isPinObscured.value && isFilled 
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
                )),
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

  Widget _buildTipsAman() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFDFDFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tips bikin PIN yang aman',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 10),
          _buildTipItem('1', 'Hindari nomor berulang & berutut, contoh 123456.'),
          SizedBox(height: 10),
          _buildTipItem('2', 'Jangan pakai tanggal lahir, nomor HP, atau nama yang mudah ditebak.'),
          SizedBox(height: 10),
          _buildTipItem('3', 'Buat PIN unik yang gak pernah dipake sebelumnya.'),
        ],
      ),
    );
  }
  
  Widget _buildTipItem(String number, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF626E7A), width: 1),
          ),
          child: Text(
            number,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonLanjut() {
    return Obx(() => GestureDetector(
      onTap: () async {
        if (authController.validateCreatePin()) {
          // Optional: Call API to create PIN
          // bool success = await authController.createPinAPI();
          // if (success) {
            Get.to(() => Home());
          // }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: authController.isPinComplete.value 
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                stops: [0.2, 1.0],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD0D0D0), Color(0xFFB0B0B0)],
                stops: [0.2, 1.0],
              ),
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          'Lanjut',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: authController.isPinComplete.value 
              ? Colors.white 
              : Colors.grey.shade600,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}
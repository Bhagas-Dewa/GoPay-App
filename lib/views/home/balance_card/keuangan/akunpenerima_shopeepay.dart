import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/balancecard_controller.dart'; // Import BalancecardController
import 'package:gopay_task/controllers/toggle_controller.dart';
import 'package:gopay_task/widgets/toggle_swtich.dart';

class AkunpenerimaShopeepay extends StatelessWidget {
  AkunpenerimaShopeepay({super.key});
  final ToggleController controller = Get.put(ToggleController());
  final BalancecardController balanceController = Get.find<BalancecardController>();
  
  final String phoneNumber = '+6281217936746';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 80, bottom: 20),
              padding: EdgeInsets.only(top: 40, bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFFDFDFD),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/circleicon_shopeepay.png',
                      height: 42,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'ShopeePay $phoneNumber',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 125),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Color(0xFFEDEDED), width: 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/arrow_kiribawah.png', height: 8),
                          SizedBox(width: 5),
                          Text(
                            'Receiving',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: DottedLine(
                      direction: Axis.horizontal,
                      dashLength: 3,
                      dashColor: Color(0xFFEEEFF3),
                      lineThickness: 1,
                      dashGapLength: 4,
                    ),
                  ),

                  _buildPemilikAkun(),
                  SizedBox(height: 30),
                  _buildDetail(),
                  SizedBox(height: 30),
                  _buildLainnya(ToggleController()),
                ],
              ),
            ),
          ),

          Positioned(
            top: 32,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_rounded, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPemilikAkun() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pemilik akun',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Image.asset('assets/icon_b.png', height: 24),
                SizedBox(width: 10),
                Text(
                  'Bhagas',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  'Ganti',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0XFF088C15),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Image.asset('assets/detail_bank.png', height: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'e-Wallet',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'ShoppePay',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/detail_account.png', height: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama akun',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'SHOPEEPAYBXXXXXXXXX4',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          // BAGIAN YANG DIUPDATE: Nomor HP dengan fungsi copy to clipboard dari controller
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/detail_nomor.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor HP',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      phoneNumber,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // Menggunakan GestureDetector dengan fungsi dari controller
                GestureDetector(
                  onTap: () => balanceController.copyToClipboard(phoneNumber),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Image.asset('assets/icon_copy.png', height: 18),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/detail_status.png', height: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Status',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Aktif',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLainnya(ToggleController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lainnya',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/lainnya_down.png', height: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atur sebagai metode penerima utama',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Transferan buat kamu akan otomatis masuk ke saldo metode ini',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ToggleSwitch(
                    value: controller.isToggled.value,
                    onChanged: (value) {
                      controller.setToggle(value);
                    },
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/lainnya_eye.png', height: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buat akun terlihat penerima lain',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Supaya orang lain bisa transfer ke akun ini.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ToggleSwitch(
                    value: controller.isToggled.value,
                    onChanged: (value) {
                      controller.setToggle(value);
                    },
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/lainnya_stop.png', height: 30),
                SizedBox(width: 10),
                Text(
                  'Hapus akun',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
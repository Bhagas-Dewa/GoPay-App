import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/toggle_controller.dart';
import 'package:gopay_task/widgets/toggle_swtich.dart';

class SumberdanaGopaysaldo extends StatefulWidget {
  SumberdanaGopaysaldo({super.key});
  final ToggleController controller = Get.put(ToggleController());

  @override
  State<SumberdanaGopaysaldo> createState() => _SumberdanaGopaysaldoState();
}

class _SumberdanaGopaysaldoState extends State<SumberdanaGopaysaldo> {
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
                      'assets/circleicon_gopay.png',
                      height: 42,
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'GoPay Saldo',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                            color: Color(0xFFEDEDED),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/arrow_kananatas.png',
                              height: 8,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Utama Pembayaran',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                            color: Color(0xFFEDEDED),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/arrow_kiribawah.png',
                              height: 8,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Penerima',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

                  _buildDetail(),
                  SizedBox(height: 30),
                  _buildLainnya(ToggleController()),
                ],
              ),
            ),
          ),

          Positioned(
            top: 28,
            left: 20,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              padding: EdgeInsets.all(1),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset('assets/button_cancel.png', height: 38),
              ),
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
              Image.asset('assets/detail_dompet.png', height: 30),
              SizedBox(width: 10),
              Text(
                'Rp5.283',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                ),
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

          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/detail_limit.png', height: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Limit dompet',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Rp20.000.000',
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
              Image.asset('assets/detail_batasakumulasi.png', height: 30),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Batas akumulasi saldo',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Rp40.000.000',
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
                Image.asset('assets/lainnya_dompetplus.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GoPay Plus',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Diterima',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 18),
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
                Image.asset('assets/lainnya_instruksi.png', height: 30),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instruksi top up',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Cek berbagai cara top up GoPay',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 18),
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
                Image.asset('assets/lainnya_up.png', height: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Atur sebagai metode pembayaran utama',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                          letterSpacing: -0.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Metode ini akan terpilih otomatis sebagai metode pembayaranmu',
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
                Image.asset('assets/lainnya_cektransaksi.png', height: 30),
                SizedBox(width: 10),
                Text(
                  'Cek transaksi',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.black,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

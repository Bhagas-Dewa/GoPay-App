import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';

class BottomsheetAkuntujuan extends StatefulWidget {
  const BottomsheetAkuntujuan({super.key});

  @override
  State<BottomsheetAkuntujuan> createState() => _BottomsheetAkuntujuanState();
}

class _BottomsheetAkuntujuanState extends State<BottomsheetAkuntujuan> {
  late TransactionController transactionController;

  @override
  void initState() {
    super.initState();
    transactionController = Get.find<TransactionController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0xFFEEEFF3),
      ),
      child: ListView(
        children: [
          Center(
            child: Container(
              height: 4,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Color(0xFFC0C5C9),
              ),
            ),
          ),

          SizedBox(height: 20),

          Text(
            'Pilih akun tujuanmu',
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          Text(
            'Silahkan pilih dari daftar akunmu. Kalo belum ada kamu bisa tambah dibawah',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),

          SizedBox(height: 50),
          Text(
            'Akun yang udah tersimpan',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 15),
          _buildAkunTersimpan(),
          SizedBox(height: 50),
          Text(
            'Tambah akun lainnya',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 15),
          _buildAkunLainnya(),
        ],
      ),
    );
  }

  Widget _buildAkunTersimpan() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFDFDFD),
      ),
      child: Obx(() {
        return Column(
          children: [
            // GoPay Option
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                children: [
                  Image.asset('assets/circleicon_gopay.png', height: 40),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'GoPay',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Kamu juga bisa top up saldo',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.1,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Radio<int>(
                    value: 1,
                    groupValue: transactionController.selectedPaymentMethod?.id ?? 0,
                    onChanged: (value) {
                      // GoPay bisa dipilih tapi tidak mengubah container di parent
                      transactionController.setPaymentMethodById(1);
                    },
                    activeColor: Color(0XFF088C15),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Color(0XFFE9FFEA),
                  border: GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [
                        Color(0XFF3DC66C),
                        Color(0XFF01AED6),
                        Color(0XFF3DC66C),
                      ],
                      stops: [0.1, 0.3, 0.9],
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Image.asset('assets/circleicon_moneybag.png', height: 24),
                    SizedBox(width: 10),
                    Text(
                      'Update dan trasnfer tanpa limit saldo',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 24,
                      color: Color(0XFF0A7F16),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 55, top: 10, bottom: 10),
              child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
            ),

            // ShopeePay Option
            GestureDetector(
              onTap: () {
                transactionController.setPaymentMethodById(2);
                Get.back(); // Close bottomsheet
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Image.asset('assets/circleicon_shopeepay.png', height: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ShopeePay ',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: '+6281217936746',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Transfer ke Bxxxxxxxxx4',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.1,
                            ),
                          ),
                          Text(
                            'ShopeePay bakal kenain tambahan biaya top up',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Radio<int>(
                      value: 2,
                      groupValue: transactionController.selectedPaymentMethod?.id ?? 0,
                      onChanged: (value) {
                        transactionController.setPaymentMethodById(2);
                        Get.back(); // Close bottomsheet
                      },
                      activeColor: Color(0XFF088C15),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 55, top: 10, bottom: 10),
              child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
            ),

            // BLU Option
            GestureDetector(
              onTap: () {
                transactionController.setPaymentMethodById(3);
                Get.back(); // Close bottomsheet
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    Image.asset('assets/circletopup_blu.png', height: 40),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'BLU By BCA Digital ',
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                TextSpan(
                                  text: '006865633699',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Transfer ke Bhagas Satrya Dewa',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5),
                    Radio<int>(
                      value: 3,
                      groupValue: transactionController.selectedPaymentMethod?.id ?? 0,
                      onChanged: (value) {
                        transactionController.setPaymentMethodById(3);
                        Get.back(); // Close bottomsheet
                      },
                      activeColor: Color(0XFF088C15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildAkunLainnya() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0XFFFDFDFD),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Image.asset('assets/icon_bank.png', height: 24),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah Rekening bank',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Begitu ditambah, nanti rekeningnya bakal kesimpen di daftar akunmu',
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
                Icon(
                  Icons.add_circle_rounded,
                  color: Color(0XFF088C15),
                  size: 22,
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 55, top: 10, bottom: 10),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Image.asset('assets/icon_ewaller.png', height: 24),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah E-wallet kamu',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Biar kamu bisa transfer ke e-wallet kamu yang lain, seperti OVO, Dana, dll',
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
                Icon(
                  Icons.add_circle_rounded,
                  color: Color(0XFF088C15),
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
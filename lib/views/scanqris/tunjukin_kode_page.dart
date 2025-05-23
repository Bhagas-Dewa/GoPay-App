import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_page.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/dompetgopay_bottomsheet.dart';

class TunjukinKodePage extends StatelessWidget {
  const TunjukinKodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),

      appBar: AppBar(
        backgroundColor: Color(0xFFEEEFF3),
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Kode GoPay',
                  style: GoogleFonts.lora(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.help_rounded, size: 16, color: Colors.black),
                      SizedBox(width: 5),
                      Text(
                        'Cara pakai',
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
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          SizedBox(height: 15),
          Text.rich(
            TextSpan(
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.3,
                color: const Color(0XFF626E7A),
              ),
              children: [
                const TextSpan(
                  text: 'Kasir akan scan kode dibawah ini.\nMaks. pembayaran ',
                ),
                TextSpan(
                  text: 'Rp1.500.000',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),

          Stack(
            children: [
              Container(
                height: 500,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0XFF737478), Color(0XFF464A4D)],
                    stops: [0.02, 0.05],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                            children: [
                              const TextSpan(text: 'Kode hangus dalam '),
                              TextSpan(
                                text: '02.54',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 1),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.white, Color(0XFF464A4D)],
                              stops: [0.001, 0.95],
                            ),
                          ),
                          child: Text(
                            'Perbarui',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.white,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(height: 440),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 440,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0XFFE2E5EA), width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: Icon(Icons.zoom_out_map_rounded, size: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 60),
                        Container(
                          child: Image.asset(
                            'assets/qrcode.png',
                            color: Colors.black,
                            height: 250,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 55),

          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: Color(0XFFE2E5EA), width: 1),
                  ),
                  child: Image.asset('assets/logo_dompetgopay.png', height: 26),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'GoPay',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Saldo: Rp202',
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
                GestureDetector(
                  onTap: () {
                    Get.to(TopUpPage());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      color: Color(0XFFE9FFEA),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Color(0XFFE2E5EA), width: 0.5),
                    ),
                    child: Text(
                      'Top up',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF0A7F16),
                        letterSpacing: -0.03,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.bottomSheet(
                      FractionallySizedBox(
                        heightFactor: 0.92,
                        child: DompetGoPayBottomSheet(),
                      ),
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0XFFE2E5EA), width: 1),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                      size: 18,
                    ),
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

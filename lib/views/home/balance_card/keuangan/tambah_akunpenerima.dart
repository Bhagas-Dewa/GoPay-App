import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/transfer_ewallet.dart';
import 'package:gopay_task/views/home/balance_card/tariktunai/tariktunai_bank.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class TambahAkunpenerima extends StatefulWidget {
  const TambahAkunpenerima({super.key});

  @override
  State<TambahAkunpenerima> createState() => _TambahAkunpenerimaState();
}

class _TambahAkunpenerimaState extends State<TambahAkunpenerima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Tambah akun penerima'),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(() => TariktunaiBank());
              },
              child: Container(
                height: 100,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0XFFFDFDFD),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, -3),
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/icon_bank.png', height: 24),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rekening bank',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Nanti orang lain bisa transfer ke rek. bank yang kamu tambah',
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
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
            child: GestureDetector(
              onTap: () => Get.to(() => TransferEwallet()),
              child: Container(
                height: 80,
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 12,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(0XFFFDFDFD),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, -3),
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset('assets/icon_ewaller.png', height: 24),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'E-wallet',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Tambah OVO, Dana, atau ShopeePay buat terima trasnferan',
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
            ),
          ),

          Container(
            padding: EdgeInsets.only(top: 160),
            height: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: Container(color: const Color(0xFFEEEFF3)),
                ),

                // Kurva putih dengan clipper
                Positioned(
                  top: -15,
                  left: 20,
                  right: 20,
                  height: 35,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(color: Colors.white),
                  ),
                ),

                // Border pada kurva
                Positioned(
                  top: -15,
                  left: 0,
                  right: 0,
                  height: 33,
                  child: CustomPaint(
                    painter: WavePainter(
                      dottedLineOffset: 8.0,
                      drawShadow: true,
                    ),
                    size: Size(MediaQuery.of(context).size.width, 40),
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

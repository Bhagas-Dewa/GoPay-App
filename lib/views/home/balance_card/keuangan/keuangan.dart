import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_widget_cache.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/akunpenerima_blu.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/akunpenerima_shopeepay.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/keuangan_asuransi.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/keuangan_simpanan.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/sumberdana_coins.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/sumberdana_gopaylater.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/sumberdana_gopaysaldo.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/tambah_akunpenerima.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/tambah_sumberdana.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Keuangan extends StatefulWidget {
  GopaySaldoController get saldoController => Get.find<GopaySaldoController>();
  const Keuangan({super.key});

  @override
  State<Keuangan> createState() => _KeuanganState();
}

class _KeuanganState extends State<Keuangan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Keuangan'),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sumber dana',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    letterSpacing: -0.3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => TambahSumberdana());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 14,
                      right: 7,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Color(0XFFE9FFEA),
                      border: Border.all(
                        color: Color(0XFF3DC66C).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Tambah',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color(0XFF0A7F16),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildSumberdana(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Simpanan & asuransi',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildSimpananAsuransi(),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Pinjaman',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF000000),
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildPinjaman(),
          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Akun penerima',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF000000),
                    letterSpacing: -0.3,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => TambahAkunpenerima());
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 14,
                      right: 7,
                      top: 10,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Color(0XFFE9FFEA),
                      border: Border.all(
                        color: Color(0XFF3DC66C).withOpacity(0.5),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Tambah',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.add_circle_outline_rounded,
                          color: Color(0XFF0A7F16),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildAkunPenerima(),

          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildSumberdana() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => SumberdanaGopaysaldo());
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 40,
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
                    color: Colors.black.withOpacity(0.03),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/circleicon_gopay.png', height: 28),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'GoPay Saldo',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                'Utama',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Color(0xFF626E7A),
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.arrow_outward_rounded,
                                size: 12,
                                color: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Obx(() {
                        final saldoController =
                            Get.find<GopaySaldoController>();
                        return Text(
                          saldoController.formattedSaldo,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }),
                    ],
                  ),

                  SizedBox(height: 25),

                  Container(
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
                        Image.asset(
                          'assets/circleicon_moneybag.png',
                          height: 24,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Upgrade & dapetin bunga 2.5%',
                          style: GoogleFonts.inter(
                            fontSize: 14,
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
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 140),
          child: GestureDetector(
            onTap: () {
              Get.to(() => SumberdanaCoins());
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 50,
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
                  Image.asset('assets/circleicon_coins.png', height: 28),
                  SizedBox(width: 10),
                  Text(
                    'Coins',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '0',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 210),
          child: GestureDetector(
            onTap: () {
              Get.to(() => SumberdanaGopaylater());
            },
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 12,
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
                  Image.asset('assets/circleicon_gopaylater.png', height: 28),
                  SizedBox(width: 10),
                  Text(
                    'GoPay Later',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Spacer(),
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
          padding: EdgeInsets.only(top: 275),
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: Container(color: const Color(0xFFEEEFF3))),

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
                  painter: WavePainter(dottedLineOffset: 8.0, drawShadow: true),
                  size: Size(MediaQuery.of(context).size.width, 40),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSimpananAsuransi() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(top: 180),
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: Container(color: const Color(0xFFEEEFF3))),

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
                  painter: WavePainter(dottedLineOffset: 8.0, drawShadow: true),
                  size: Size(MediaQuery.of(context).size.width, 40),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => KeuanganSimpanan());
            },
            child: Container(
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
                  Image.asset('assets/keuangan_simpanan.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Simpanan',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Sisihin uang simpanan darurat',
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
          padding: const EdgeInsets.only(left: 20, right: 20, top: 65),
          child: GestureDetector(
            onTap: () {
              Get.to(() => KeuanganAsuransi());
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12),
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
                    color: Colors.black.withOpacity(0.03),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/keuangan_asuransi.png', height: 28),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asuransi',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Text(
                            'Temukan asuransi sesuai kebutuhanmu',
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
                      Icon(
                        Icons.add_circle_rounded,
                        color: Color(0XFF088C15),
                        size: 22,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Container(
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
                        Image.asset('assets/icon_shieldhijau.png', height: 24),
                        SizedBox(width: 10),
                        Text(
                          'Mulai dari Rp1.000/bulan',
                          style: GoogleFonts.inter(
                            fontSize: 14,
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPinjaman() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(top: 175),
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: Container(color: const Color(0xFFEEEFF3))),

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
                  painter: WavePainter(dottedLineOffset: 8.0, drawShadow: true),
                  size: Size(MediaQuery.of(context).size.width, 40),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 40),
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
                  color: Colors.black.withOpacity(0.03),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/circleicon_moneybag.png', height: 28),
                    SizedBox(width: 10),
                    Text(
                      'Pinjam',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Container(
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
                      Image.asset('assets/iconkeuangan_money.png', height: 18),
                      SizedBox(width: 10),
                      Text(
                        'Aktifin buat pinjam s.d. 25juta',
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
              ],
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 120),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 12),
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
                Image.asset('assets/keuangan_bpkb.png', height: 28),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pinjaman BPKP',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Pembiayaan tunai dengan jaminan BPKB',
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
                Icon(
                  Icons.add_circle_rounded,
                  color: Color(0XFF088C15),
                  size: 22,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAkunPenerima() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(top: 120),
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: Container(color: const Color(0xFFEEEFF3))),

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
                  painter: WavePainter(dottedLineOffset: 8.0, drawShadow: true),
                  size: Size(MediaQuery.of(context).size.width, 40),
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(() => AkunpenerimaShopeepay());
            },
            child: Container(
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
                  Image.asset('assets/circleicon_shopeepay.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'ShopeePay',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '+628117936746',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Bxxxxxxxxxxx4',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 65),
          child: GestureDetector(
            onTap: () {
              Get.to(() => AkunpenerimaBlu());
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 5),
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
                  Image.asset('assets/circletopup_blu.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'BLU By BCA Digital',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '006885249985',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Bhagas Satrya Dewa',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

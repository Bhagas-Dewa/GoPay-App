import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/akunpenerima_blu.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/akunpenerima_shopeepay.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/tambah_akunpenerima.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/transfer_ewallet.dart';
import 'package:gopay_task/views/home/balance_card/tariktunai/tariktunai_bank.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_bank.dart';
import 'package:gopay_task/views/home/bantuan/bantuan_page.dart';
import 'package:gopay_task/views/home/kirim_terima/transfer/transfer_transaction.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';
import 'package:gopay_task/widgets/button_ceklain.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        title: 'Transfer',
        rightIcon: GestureDetector(
          onTap: () {
            Get.to(()=> BantuanPage());
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.help_outlined,
              color: Color.fromARGB(255, 61, 61, 61),
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ke akunmu',
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
          _buildAkunPenerima(context),
          SizedBox(height: 65),
          _buildTransfer(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildAkunPenerima(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.only(top: 134),
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
          //pilihan shopeepay
          child: GestureDetector(
            onTap: () {
              Get.to(()=> TransferTransaction(defaultPaymentMethod: 'ShopeePay'));
            },
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 30),
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
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => AkunpenerimaShopeepay());
                    },
                    child: Icon(
                      Icons.more_vert_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 65),
              child: GestureDetector(
                onTap: () {
                  // default ke blu
                  Get.to(()=> TransferTransaction(defaultPaymentMethod: 'Blu'));
                },
                child: Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 12,
                    bottom: 5,
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
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => AkunpenerimaBlu());
                        },
                        child: Icon(
                          Icons.more_vert_rounded,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              top: 56,
              left: 16,
              child: Image.asset('assets/label_gratistransfer.png', height: 24),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTransfer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0XFFFDFDFD),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Transfer ke orang lain',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => TariktunaiBank());
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 22,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFEEEFF3),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/icon_bank.png',
                                height: 24,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Banks',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: -8,
                      left: -2,
                      child: Image.asset(
                        'assets/label_gratistransfer.png',
                        height: 24,
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(()=> TransferEwallet());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(13),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/icon_ewaller.png',
                            height: 24,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'E-wallet',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 22,
                        vertical: 22,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(13),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              'assets/circleicon_gopay.png',
                              height: 24,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'GoPay',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -8,
                      left: -2,
                      child: Image.asset(
                        'assets/label_gratistransfer.png',
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFE6E7E9), Color(0XFFF1F2F4)],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, size: 26, color: Colors.black),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ketik nama atau nomor HP',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Sering ditransfer',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Image.asset('assets/searchblue.png', height: 60),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Masih sepi, nih',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Nanti yang sering kamu transfer bakal muncul di sini.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleBank(
                  imagePaths: [
                    'assets/circle_avatar1.png',
                    'assets/circle_avatar2.png',
                    'assets/circle_avatar3.png',
                  ],
                ),

                GestureDetector(
                  onTap: () {},
                  child: ButtonCekLain(text: 'Lihat semua kontak'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleBank({
    required List<String> imagePaths,
    double width = 80,
    double height = 32,
    double radius = 16,
    double spacing = 25,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.centerLeft,
        clipBehavior: Clip.none,
        children: List.generate(
          imagePaths.length,
          (index) => Positioned(
            left: index * spacing,
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePaths[index]),
              radius: radius,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFEDEDED), width: 1),
                  borderRadius: BorderRadius.circular(radius * 2.8),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/bantuan/bantuan_page.dart';
import 'package:gopay_task/views/home/kirim_terima/hadiah/hadiah_diterima.dart';
import 'package:gopay_task/views/home/kirim_terima/hadiah/list_hadiah.dart';
import 'package:gopay_task/widgets/bottomcurve_clipper.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class HadiahPage extends StatefulWidget {
  const HadiahPage({super.key});

  @override
  State<HadiahPage> createState() => _HadiahPageState();
}

class _HadiahPageState extends State<HadiahPage> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF77D1E9), Color(0xFFEEEFF3)],
                          stops: [0.2, 0.9],
                        ),
                      ),
                      child: _buildHadiahUpper(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 40,
                    child: IgnorePointer(
                      child: CustomPaint(
                        painter: BottomCurveBorderPainter(
                          lineColor: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              _buildTabView(),
              _buildTabContent(),
            ],
          ),
          Positioned(
            top: 32,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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

                GestureDetector(
                  onTap: () {
                    Get.to(()=> BantuanPage());
                  },
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
                    child: Icon(Icons.help_rounded, size: 24),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHadiahUpper() {
    return Column(
      children: [
        SizedBox(height: 60),
        Image.asset('assets/sticker_angpao.png', height: 300),
        SizedBox(height: 15),
        Text(
          'Kirim hadiah dari cara baru, biar makin seru',
          style: GoogleFonts.lora(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: -0.3,
            height: 1.15,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          'Bisa atur cara bagi-baginya, sesuai kebutuhanmu!',
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        GestureDetector(
          onTap: () {
            Get.to(()=>ListHadiah());
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                stops: [0.2, 1.0],
              ),
              borderRadius: BorderRadius.circular(45),
            ),
            child: Text(
              'Pilih penerima',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white,
                letterSpacing: -0.3,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Widget _buildTabView() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFFAFAFA), Color(0xFFEEEFF3)],
          stops: [0.1, 0.7],
        ),
      ),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Color(0XFFE2E5EA),
        ),
        child: Row(
          children: [
            // Dikirim tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: _selectedTabIndex == 0 ? Colors.white : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/arrow_white1.png',
                        width: 10,
                        color:
                            _selectedTabIndex == 0
                                ? Colors.black
                                : Colors.grey[500],
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Diterima',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              _selectedTabIndex == 0
                                  ? Colors.black
                                  : Colors.grey[700],
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Dikirim tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: _selectedTabIndex == 1 ? Colors.white : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/arrow_white2.png',
                        width: 10,
                        color:
                            _selectedTabIndex == 0
                                ? Colors.grey[500]
                                : Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Dikirim',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                          color:
                              _selectedTabIndex == 1
                                  ? Colors.black
                                  : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Container(
      color: Color(0xFFEEEFF3),
      child: _selectedTabIndex == 0 ? _buildTabDiterima() : _buildTabDikirim(),
    );
  }

  Widget _buildTabDiterima() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 100),
      child: GestureDetector(
        onTap: () {
          Get.to(() => HadiahDiterima());
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              bottom: -45,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.only(top: 25, bottom: 12, left: 20, right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Color(0XFFF5F6F8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.timer, size: 20, color: Color(0xFF626E7A)),
                    SizedBox(width: 5),
                    Text(
                      'Hangus pada',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '26 Maret',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            Container(
              height: 105,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFEEEFF3), width: 1),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFFEEEFF3).withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "GI",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dapet hadiah dari',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'GoPay Indonesia',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/icon_angpao.png', height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabDikirim() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Image.asset('assets/paper_plane.png', height: 30),
          SizedBox(height: 15),
          Text(
            'Kamu belum kirim hadiah',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Nanti kamu bisa cek hadiah terkirim disini',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: const Color(0xFF626E7A),
              fontWeight: FontWeight.w400,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}

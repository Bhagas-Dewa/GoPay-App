import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class KeuanganSimpanan extends StatefulWidget {
  const KeuanganSimpanan({super.key});

  @override
  State<KeuanganSimpanan> createState() => _KeuanganSimpananState();
}

class _KeuanganSimpananState extends State<KeuanganSimpanan> {
  final ScrollController _scrollController = ScrollController();
  
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Fixed elements - Background & Top Section
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Background Image (fixed)
                Image.asset(
                  'assets/background_simpanan.png',
                  height: 245,
                  width: double.infinity,
                ),
              ],
            ),
          ),

          // Fixed Title Text
          Positioned(
            top: 115,
            left: 0,
            right: 0,
            child: Text(
              'Raih impian dengan nabung di Simpanan',
              style: GoogleFonts.lora(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Scrollable Content - Starting below the nav
          Positioned.fill(
            top: 40, 
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Space for background image and title (they will be covered)
                  SizedBox(height: 175),

                  // Top Rounded Container (now scrollable)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 23,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -1),
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                        color: Color(0xFFFDFDFD),
                      ),
                    ),
                  ),

                  // Wavy Section
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    height: 35,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned.fill(
                          bottom: -150,
                          child: Container(
                            color: Color(0xFFEEEFF3),
                            ),
                        ),

                        // Kurva putih dengan clipper
                        Positioned(
                          top: -15,
                          left: 25,
                          right: 25,
                          height: 35,
                          child: ClipPath(
                            clipper: WaveClipper(),
                            child: Container(color: Color(0xFFFDFDFD)),
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

                  SizedBox(height: 10),

                  // Coins Container
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFFDFDFD),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            bottom: -3,
                            right: -10,
                            child: Image.asset(
                              'assets/simpanan_spark.png',
                              height: 65,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/simpanan_karung.png',
                                height: 28,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Ada Coins s.d. 15jt buatmu',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      'Cukup dengan nabung mulai dari 10rb kamu bisa dapetin hadiah fantastis',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: Color(0xFF626E7A),
                                        letterSpacing: -0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFFDFDFD),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: Color(0xffE2E5EA),
                                    width: 1,
                                  ),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Icon(Icons.help_rounded, size: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: inset.BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0XFFE8E9EB),
                        boxShadow: [
                          inset.BoxShadow(
                            inset: true,
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            color: Color(0xFFC0C5C9).withOpacity(0.4),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/simpanan_hands.png',
                                width: 30,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dapetin bunga 3.75%',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      'Makin lama nabung makin berkembang juga saldomu.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xFF626E7A),
                                        letterSpacing: -0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/simpanan_print.png',
                                width: 30,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Gak ada biaya admin bulanan',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      'Tarik dana tanpa biaya penalti.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xFF626E7A),
                                        letterSpacing: -0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/simpanan_plant.png',
                                width: 30,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Nabung bisa dari berapa pun',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      'Gak perlu saldo gede buat mulai.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xFF626E7A),
                                        letterSpacing: -0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/simpanan_date.png',
                                width: 30,
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Fitur nabung otomatis',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    Text(
                                      'Kalau udah nyala, saldo otomatis tersisihkan biar impianmu tercapai.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: Color(0xFF626E7A),
                                        letterSpacing: -0.3,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Container(
                      height: 0.8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFFDFDFD),
                            Color(0XFFC2E2ED),
                            Color(0XFF01AED6),
                            Color(0XFFC2E2ED),
                            Color(0xFFFDFDFD),
                          ],
                          stops: [0, 0.1, 0.5, 0.9, 1],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/logo_shield.png',
                          height: 24,
                          color: Color(0XFF088C15),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            'Simpanan adalah produk Bank Jago yang bekerja sama dengan GoPay. PT Bank Jago Tbk berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK) dan Bank Indonesia, serta merupakan peserta penjaminan LPS.',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Add some padding at the bottom for scrolling beyond the bottom nav
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Fixed Top Navigation Icons - Now stays on top always
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
                    child: Image.asset('assets/button_cancel.png', height: 24),
                  ),
                ),

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
                  child: Icon(Icons.help_rounded, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFDFDFD),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0XFF5DB466), Color(0XFF088C15)],
              stops: [0.0, 1.0],
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            'Bikin Simpanan',
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
    );
  }
}
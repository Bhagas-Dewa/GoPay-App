import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/home_controller.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/keuangan.dart';
import 'package:gopay_task/views/home/balance_card/keuangan/keuangan_asuransi.dart';
import 'package:gopay_task/views/home/balance_card/tabungan/aktif_tabungan.dart';
import 'package:gopay_task/views/home/balance_card/tariktunai/tariktunai_page.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_page.dart';
import 'package:gopay_task/widgets/bottomcurve_clipper.dart';

class BalanceCard extends StatefulWidget {
  BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: () {
              Get.to(()=> Keuangan());
            },
            child: Container(
              height: 270,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xFF0D1D2A), // 0%
                    Color(0xFF0A2B61), // 7%
                    Color(0xFF106AB1), // 21%
                    Color(0xFF0E4678), // 45%
                    Color(0xFF0C223F), // 80%
                    Color(0xFF0D1D2A), // 100%
                  ],
                  stops: [0.0, 0.07, 0.21, 0.45, 0.80, 1.0],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/logo_onboarding.png',
                          height: 16,
                          width: 16,
                          color: Color(0XFF01AED6),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'gopay',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 6),
                        Obx(
                          () => GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              print('TAPPED');
                              homeController.toggleEyes();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8.0), // Area klik lebih besar
                              child: Image.asset(
                                homeController.getEyesAsset(),
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  SizedBox(height: 5),
                  //Row bagian nominal dan Top up nomial
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        //bagian kiri
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                homeController.getBalanceText(),
                                style: GoogleFonts.lora(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ),
                            SizedBox(height: 2),
                            // Gunakan Obx untuk reactive update
                            Obx(
                              () => Text(
                                homeController.getCoinsText(),
                                style: GoogleFonts.lora(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
            
                        //bagian kanan
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                Get.to(()=> TopUpPage());
                                print('Top-up tapped');
                              },
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Image.asset(
                                        'assets/button_topup.png',
                                        height: 45,
                                        width: 45,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Top up',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0A7F16),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        'Gratis',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                    
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                print('Tarik tunai tapped');
                                Get.to(()=> TariktunaiPage());
                              },
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Image.asset(
                                        'assets/button_tariktunai.png',
                                        height: 45,
                                        width: 45,
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Tarik tunai',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 6),
                                      decoration: BoxDecoration(
                                        color: Color(0xFF0A7F16),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        'Gratis',
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  //Row bagiana upgrade dll
                  SizedBox(
                    height: 30, 
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (notification) {
                        return false;
                      },
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(), 
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(width: 20),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                print('Aktifin Pinjam tapped');
                                // Tambahkan fungsi aktifin pinjam di sini
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Color(0xFF0D1D2A),
                                    width: 0.7,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.shopping_bag_sharp,
                                      color: Color(0XFF01AED6),
                                      size: 15,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Aktifin Pinjam',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0XFF3DC66C),
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                print('Upgrade Tabungan tapped');
                                Get.to(()=> AktifTabungan());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Color(0xFF0D1D2A),
                                    width: 0.7,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.savings_rounded,
                                      color: Color(0XFF01AED6),
                                      size: 15,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Upgrade Tabungan',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0XFF3DC66C),
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            
                            GestureDetector(
                              onTap: () {
                                Get.to(()=> KeuanganAsuransi());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.03),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: Color(0xFF0D1D2A),
                                    width: 0.7,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.health_and_safety_rounded,
                                      color: Color(0XFF01AED6),
                                      size: 15,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'Aktifin Asuransi',
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.3,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0XFF3DC66C),
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          top: 201,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print('Analytics card tapped');
                // Tambahkan fungsi analytics di sini
              },
              child: Container(
                height: 70,
                padding: EdgeInsets.only(bottom: 22, left: 24, right: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF0087A7),
                      Color(0xFF0096BA),
                      Color(0xFF0087A7),
                    ],
                    stops: [0.0, 0.5, 1.8],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.analytics_rounded, color: Colors.white, size: 18),
                    SizedBox(width: 6),
                    Text(
                      'Rp 19.900',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(width: 3),
                    Text(
                      'udah terpakai di April',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Color(0xFF0A2B61).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        color: Color(0XFF3DC66C),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 40, 
          child: IgnorePointer(
            child: CustomPaint(
              painter: BottomCurveBorderPainter(),
            ),
          ),
        ),
      ],
    );
  }
}


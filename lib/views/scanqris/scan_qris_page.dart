import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/qris_controller.dart';
import 'package:gopay_task/views/home/balance_card/tabungan/aktif_tabungan.dart';
import 'package:gopay_task/views/scanqris/qris_bantuan.dart';
import 'package:gopay_task/views/scanqris/qris_unlimited.dart';
import 'package:gopay_task/views/scanqris/tunjukin_kode_page.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:torch_light/torch_light.dart';

class ScanQrisPage extends StatelessWidget {
  ScanQrisPage({Key? key}) : super(key: key);

  final QrisController qrisController = Get.put(QrisController());

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/icon_qr.png',
      'assets/logo_alfamart.png',
      'assets/logo_indomart.png',
    ];

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            // allowDuplicates: false,
            // onDetect: (barcode, args) {
            //   if (barcode.rawValue == null) {
            //     debugPrint('Failed to scan Barcode');
            //   } else {
            //     final String code = barcode.rawValue!;
            //     debugPrint('Barcode found! $code');
            //     // Lakukan tindakan sesuai dengan kode QR yang dipindai
            //   }
            // },
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: Color(0xFFEDEDED), width: 1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color(0XFF3D3D3D),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.to(() => QrisBantuan());
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: Color(0xFFEDEDED), width: 1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.question_mark_rounded,
                        size: 20,
                        color: Color(0XFF3D3D3D),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Get.find<QrisController>().pickImage();
                  },
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: Color(0xFFEDEDED), width: 1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.image_search_rounded,
                        size: 20,
                        color: Color(0XFF3D3D3D),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Obx(
                  () => GestureDetector(
                    onTap: () {
                      qrisController.toggleFlash();
                    },
                    child: Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(color: Color(0xFFEDEDED), width: 1),
                      ),
                      child: Center(
                        child: Icon(
                          qrisController.isFlashOn.value
                              ? Icons.flash_on_rounded
                              : Icons.flash_off_rounded,
                          size: 20,
                          color: Color(0XFF3D3D3D),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Powered by',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    SizedBox(width: 5),
                    Image.asset('assets/qris-white.png', height: 20),
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => {
                    Get.to(()=> QrisUnlimited()),
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFF3BBFD7),
                          Color(0xFF58C4B0),
                          Color(0xFF57B791),
                          Color(0xFF3DA74D),
                        ],
                        stops: [0.0, 0.3, 0.6, 1.0],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Dapetin cashback tiap transaksi QRIS',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Color(0xFFEDEDED),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> AktifTabungan());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 1.5),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFE8EEF1),
                            Color(0xFF30C8E0),
                            Color(0xFF1294E2),
                            Color(0xFF2468E9),
                          ],
                          stops: [0.0, 0.3, 0.7, 1.0],
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/qris_iconbag.png', height: 18),
                          SizedBox(width: 8),
                          Text(
                            'Jajan tetep jalan sambil dapet bunga s.d.\n2.5%',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: GestureDetector(
                              // onTap: () => ,
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                color: Color(0XFF3D3D3D),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 1.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(()=> TunjukinKodePage());
                          },
                          child: Container(
                            width: 162,
                            padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Colors.black.withOpacity(0.15),
                                  offset: Offset(-0.2, -0.2),
                                  spreadRadius: 1.5,
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                CarouselSlider(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    aspectRatio: 7,
                                    enlargeCenterPage: false,
                                  ),
                                  items:
                                      imgList
                                          .map(
                                            (item) => Container(
                                              child: Center(
                                                child: Image.asset(
                                                  item,
                                                  height: 24,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Tunjukkin kode',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF626E7A),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 162,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Colors.black.withOpacity(0.15),
                                offset: Offset(0.2, -0.2),
                                spreadRadius: 1.5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/qris_qristap.png',
                                height: 24,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'QRIS tap',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF626E7A),
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

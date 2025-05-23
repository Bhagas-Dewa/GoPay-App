import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/bantuan/bantuan_page.dart';
import 'package:gopay_task/views/pengaturan/pengaturan_page.dart';
import 'package:gopay_task/views/home/balance_card/balance_card.dart';
import 'package:gopay_task/views/home/banner_iklan.dart';
import 'package:gopay_task/views/home/kirim_terima/kirim_terima.dart';
import 'package:gopay_task/views/home/layanan_fav_warga/layanan_fav_warga.dart';
import 'package:gopay_task/widgets/bottomcurve_clipper.dart';
import 'package:gopay_task/widgets/navigation_bar.dart';
import 'package:gopay_task/views/home/pembayaran/pembayaran.dart';
import 'package:gopay_task/views/home/program_pemerintah/program_pemerintah.dart';
import 'package:gopay_task/views/home/promo_hiburan/promo_hiburan.dart';
import 'package:gopay_task/views/home/riwayat_transaksi/riwayat_transaksi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _appBar(),
                  SizedBox(height: 12),
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: BalanceCard(),
                  ),
                  SizedBox(height: 5),
                  KirimTerima(),
                  SizedBox(height: 12),
                  Pembayaran(),
                  SizedBox(height: 12),
                  PromoHiburan(),
                  SizedBox(height: 12),
                  LayananFavWarga(),
                  SizedBox(height: 12),
                  RiwayatTransaksi(),
                  SizedBox(height: 12),
                  ProgramPemerintah(),
                  SizedBox(height: 12),
                  BannerIklan(),
                  SizedBox(height: 50),
                  _buttonTheme(),
                  SizedBox(height: 120),
                ],
              ),
            ),

            // Posisikan BottomNavbar di bagian bawah
            Positioned(left: 0, right: 0, bottom: 0, child: BottomNavbar()),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.to(() => PengaturanPage());
              print('circle avatar dipencet');
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/photo_profile.png',
                height: 35,
                width: 35,
              ),
            ),
          ),
          SizedBox(width: 42),
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0XFF2B2088), Color(0xFF0A2B61)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.warning_rounded, color: Colors.white, size: 18),
                  SizedBox(width: 4),
                  Text(
                    'Waspada judi online!',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 42),
          GestureDetector(
            onTap: () {
              Get.to(()=>BantuanPage());
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.help_outlined,
                color: Color.fromARGB(255, 61, 61, 61),
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonTheme() {
    return Container(
      child: Column(
        children: [
          Text(
            'Kamu tim mana?',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
              letterSpacing: -0.3,
            ),
          ),
          Text(
            'Sisi gelap atau terang? ayo pilih di sini!🌟',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
              color: Color(0XFFFCFCFC).withOpacity(0.5),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}

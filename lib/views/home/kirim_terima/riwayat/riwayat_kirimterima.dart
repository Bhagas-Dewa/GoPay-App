import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RiwayatKirimterima extends StatefulWidget {
  const RiwayatKirimterima({super.key});

  @override
  State<RiwayatKirimterima> createState() => _RiwayatKirimterimaState();
}

class _RiwayatKirimterimaState extends State<RiwayatKirimterima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF9FAFC),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08), // shadow tipis
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 10),
                  Image.asset('assets/photo_profile.png', width: 45),
                  SizedBox(width: 5),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Bhagas (Kamu)",
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.verified_rounded,
                              color: Colors.blue,
                              size: 16,
                            ),
                          ],
                        ),
                        Text(
                          "GoPay +6281217936746, ShopeePay  6281217936746",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.menu_rounded, color: Colors.black, size: 24),
                ],
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _buildProfile(),
          SizedBox(height: 30),
          _buildTanggal(),
          SizedBox(height: 15),
          _buildItemTransfer(),
        ],
      ),

      bottomNavigationBar: Container(
        height: 125,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF9FAFC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildMenuItem('assets/icon_ewaller.png', 'Top up'),
            _buildMenuItem('assets/simpanan_print.png', 'Tarik tunai'),
            _buildMenuItem('assets/qris_unlimited_barcode.png', 'My QR'),
            _buildMenuItem('assets/kirimterima_pesawat.png', 'Transfer'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 70),
        Image.asset('assets/photo_profile.png', width: 70),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              "Bhagas (Kamu)",
              style: GoogleFonts.lora(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(width: 5),
            Icon(Icons.verified_rounded, color: Colors.blue, size: 20),
          ],
        ),
        SizedBox(height: 2),
        Text(
          "GoPay +6281217936746, ShopeePay *6746, BLU By BCA Digital *9985",
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Gabung pada Nov 2023',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Kalau kamu top up akun kamu atau tarik tunai, kamu bisa lihat riwayatnya di sini.',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildTanggal() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 105),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
        ),
        child: Text(
          'Friday, 21 Mar 2025',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildItemTransfer() {
    return Padding(
      padding: const EdgeInsets.only(left: 85),
      child: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("assets/circleicon_shopeepay.png", height: 36),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Transfer e-wallet ke SHOPEEPAYBXXXXXXXXX4',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: 5),
                Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Rp116.000',
              style: GoogleFonts.lora(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
              maxLines: 2,
            ),
            Text(
              '| ShopeePay 6281217936746',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
                fontStyle: FontStyle.italic,
              ),
            ),

            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/circleicon_gopay.png', height: 18),
                SizedBox(width: 5),
                Text(
                  'Dibayar dengan GoPay saldo',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
            Row(
              children: [
                SizedBox(width: 185),
                Text(
                  '05:01 PM',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String iconPath, String label) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 56,
            height: 56,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFEEEFF3), width: 1),
            ),
            child: Image.asset(iconPath, width: 30, height: 30),
          ),
          SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}

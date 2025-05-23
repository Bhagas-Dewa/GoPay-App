import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/balancecard_controller.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';

class SumberdanaGopaylater extends StatefulWidget {
  const SumberdanaGopaylater({super.key});

  @override
  State<SumberdanaGopaylater> createState() => _SumberdanaGopaylaterState();
}

class _SumberdanaGopaylaterState extends State<SumberdanaGopaylater> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      appBar: AppbarPrimary(
        title: 'GoPay Later',
        leftIcon: Icon(Icons.close_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF0087A7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  width: double.infinity,
                  height: 120,
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  child: _buildCardLimit(),
                ),
                Positioned(top: 235, left: 20, right: 20, child: _buildeKTP()),
                Positioned(
                  top: 325,
                  left: 20,
                  right: 20,
                  child: _buildHadiahPenggunaBaru(),
                ),
              ],
            ),

            SizedBox(height: 400),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildTabButton('Yang bikin nyaman', 0),
                  SizedBox(width: 20),
                  _buildTabButton('Cara aktifin', 1),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              child:
                  _selectedTab == 0
                      ? _buildYangBikinNyamanContent()
                      : _buildCaraAktifkanContent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 162,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.person_4_rounded,
                  color: Color(0xFF414B54),
                  size: 20,
                ),
                SizedBox(width: 10),
                Text(
                  'Kami perlu mengakses nama, email & nomor HP kamu',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Divider(color: Color(0xFFD4D6D9).withOpacity(0.5), thickness: 0.5),
            SizedBox(height: 2),

            Row(
              children: [
                Image.asset('assets/icon_shieldhijau.png', height: 20),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Didukung oleh PT Multifinance Anak Bangsa.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0XFF088C15),
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Berizin dan diawasi oleh OJK',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0XFF088C15),
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0XFF088C15),
                  size: 12,
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
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
                'Aktifkan sekarang',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    bool isSelected = _selectedTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? Color(0xFF0A7F16) : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: isSelected ? Colors.black : Color(0xFF626E7A),
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600,
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildYangBikinNyamanContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/gopaylater_hp.png', height: 30),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gak ada biaya tersembunyi',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.3,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Semua biaya kami jelaskan dari awal',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                      color: Color(0xFF626E7A),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Image.asset('assets/gopaylater_calender.png', height: 30),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beli kebutuhan jadi gak ribet',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.3,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Bayarnya gak perlu top up & bisa dicicil',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.3,
                      color: Color(0xFF626E7A),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 10),
          Divider(color: Color(0xFFD4D6D9).withOpacity(0.5), thickness: 0.5),
          SizedBox(height: 10),

          Text(
            '*Bervariasi tiap orang',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w300,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCaraAktifkanContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset('assets/gopaylater_iconmerge.png', width: 30),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lengkapin data diri kamu',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 38),
              Text(
                'Kirim buat data verifikasi',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCardLimit() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Column(
                children: [
                  Text(
                    'Dapatin limit hingga',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'RP30.000.000',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      color: Color(0xFF088C15),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Image.asset('assets/simpanan_spark.png', height: 50),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFF7F7F7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Biaya cicilan mulai',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '2% per transaksi*',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pilihan tenor',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Sampai dengan 12x*',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12),
                DottedLine(
                  dashLength: 2,
                  dashGapLength: 2,
                  lineThickness: 0.5,
                  dashColor: Color(0xFFD4D6D9),
                  direction: Axis.horizontal,
                ),
                SizedBox(height: 12),
                Text(
                  '*Bervariasi tiap orang',
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
        ],
      ),
    );
  }

  Widget _buildeKTP() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0XFFE0FFE0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0XFF088C15), width: 1),
      ),
      child: Row(
        children: [
          Image.asset('assets/icon_jam.png', height: 40),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gak perlu e-KTP!',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Color(0xFF626E7A),
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Tinggal lengkapin dan kirim aja data kamu.',
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
    );
  }

  Widget _buildHadiahPenggunaBaru() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xFFEEEFF3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hadiah buat pengguna baru!',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/pembayaran_gofood.png', height: 24),
                      const SizedBox(height: 6),
                      Text(
                        'GoFood s.d. 70%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/riwayat_ride.png', height: 24),
                      const SizedBox(height: 6),
                      Text(
                        'Trip Gojek s.d. Rp15rb',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logo_tokped.png', height: 26),
                      const SizedBox(height: 6),
                      Text(
                        'Tokopedia diskon 50%',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black,
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '*syarat dan ketentuan berlaku',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w300,
            ),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

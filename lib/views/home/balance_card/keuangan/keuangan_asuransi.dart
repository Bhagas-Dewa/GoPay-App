import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KeuanganAsuransi extends StatelessWidget {
  const KeuanganAsuransi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          ListView(
            padding: EdgeInsets.only(left: 20, right: 20, top: 105),
            children: [
              Text(
                'Asuransi terjangkau untuk semua',
                style: GoogleFonts.lora(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: -0.3,
                  height: 1.15,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                'Perlindungan pasti, untuk hidup yang berarti',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text(
                'Produk asuransi kami',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 10),

              AsuransiCard(
                iconPath: 'assets/asuransi_shield.png',
                title: 'Asuransi kesehatan',
                price: 60000,
                description: 'Harga murah manfaat lengkap',
                onTap: () {
                  print('Asuransi kesehatan tapped');
                },
              ),

              SizedBox(height: 15),

              AsuransiCard(
                iconPath: 'assets/asuransi_crash.png',
                title: 'Asuransi kecelakaan diri',
                price: 2000,
                description:
                    'Dapatkan hingga Rp40 juta untuk menanggung biaya tak terduga akibat kecelakaan pribadi.',
                isNew: true,
                onTap: () {
                  print('Asuransi kecelakaan diri tapped');
                },
              ),

              SizedBox(height: 15),

              AsuransiCard(
                iconPath: 'assets/asuransi_rawat.png',
                title: 'Asuransi santunan rawat inap',
                price: 1000,
                description:
                    'Manfaat tunai untuk lindungi pemasukanmu dari pengeluaran tak terduga karena rawat inap.',
                isNew: true,
                onTap: () {
                  print('Asuransi rawat inap tapped');
                },
              ),

              SizedBox(height: 15),

              AsuransiCard(
                iconPath: 'assets/asuransi_pita.png',
                title: 'Asuransi kanker',
                price: 1000,
                description:
                    '390rb kasus kanker didiagnosis setiap tahunnya. Lindungi diri dari yang tak terduga.',
                isNew: false,
                onTap: () {
                  print('Asuransi kanker tapped');
                },
              ),

              SizedBox(height: 15),

              AsuransiCard(
                iconPath: 'assets/asuransi_stats.png',
                title: 'Asuransi serangan jantung',
                price: 4700,
                description:
                    'Serangan jantung penyebab 33% kematian di Indonesia. Lindungi setiap detak jantungmu.',
                isNew: false,
                onTap: () {
                  print('Asuransi jantung tapped');
                },
              ),

              SizedBox(height: 15),

              AsuransiCard(
                iconPath: 'assets/asuransi_hp.png',
                title: 'Asuransi layar HP',
                price: 1000,
                description: 'Dapatkan pelrindungan selama setahun penuh.',
                isNew: false,
                onTap: () {
                  print('Asuransi kanker tapped');
                },
              ),

              SizedBox(height: 15),

              _buildWajibAsuransi(),

              SizedBox(height: 20),
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
                    child: Image.asset('assets/button_cancel.png', height: 24),
                  ),
                ),

                Image.asset('assets/logo_gopayasuransi.png', height: 20),

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
    );
  }

  Widget _buildWajibAsuransi() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFDFDFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kenapa wajib punya asuransi?',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/wajibasuransi1.png', height: 26),
                SizedBox(width: 15),
                Text(
                  'Lindungi diri dari biaya tak terduga',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 48, right: 10, top: 12, bottom: 12),
            child: Divider(
              color: Color(0xFFEEEFF3),
              thickness: 1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/wajibasuransi2.png', height: 26),
                SizedBox(width: 15),
                Text(
                  'Jaminan aman buat diri dan keluarga',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 48, right: 10, top: 12, bottom: 12),
            child: Divider(
              color: Color(0xFFEEEFF3),
              thickness: 1,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/wajibasuransi3.png', height: 26),
                SizedBox(width: 15),
                Text(
                  'Dapet akses RS berkualitas',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    letterSpacing: -0.3,
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

class AsuransiCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final double price;
  final String description;
  final bool isNew;
  final VoidCallback? onTap;

  const AsuransiCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.price,
    required this.description,
    this.isNew = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 22, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFDFDFD),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(iconPath, height: 26),
                SizedBox(width: 15),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                if (isNew) ...[
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE8940E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      'Baru',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Mulai dari: ',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.1,
                        ),
                        children: [
                          TextSpan(
                            text: 'Rp${price.toStringAsFixed(0)}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: -0.1,
                            ),
                          ),
                          TextSpan(
                            text: '/bulan',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      description,
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
              GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Color(0xFFE2E5EA)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.3, 1.0],
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFE2E5EA), width: 1),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.arrow_forward_rounded, size: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

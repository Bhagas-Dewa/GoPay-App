import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/appbar_searchbar.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';
import 'package:gopay_task/widgets/button_lihatsemua.dart';

class DetailPembayaran extends StatefulWidget {
  const DetailPembayaran({super.key});

  @override
  State<DetailPembayaran> createState() => _DetailPembayaranState();
}

class _DetailPembayaranState extends State<DetailPembayaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppBarSearchBar(
        title: 'Pembayaran',
        searchText: 'Cari nama layanan atau rekan usaha',
        onHelpPressed: () => (),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tagihan dan langganan',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                        letterSpacing: -0.3,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => (),
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 14,
                          right: 6,
                          top: 5,
                          bottom: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0XFFF4FEF5),
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: Color(0XFF3DC66C).withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Lihat semua',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -0.1,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color(0XFF0A7F16),
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/logo_telkomsel.png',
                          height: 30,
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SIMPATI',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            '081234567890',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 3),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                              children: [
                                TextSpan(text: 'RP19.900 '),
                                TextSpan(
                                  text: '• Terakhir transaksi pada 12 Apr 2025',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF626E7A),
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: Color(0XFF0A7F16),
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          //Rekomendasi
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Rekomendasi',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_ml.png',
                        'MLBB',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/detailpembayaran_laptop.png',
                        'Promo nonton',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/detailpembayaran_bills.png',
                        'Promo bayar tagihan',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/detailpembayaran_voucher.png',
                        'Promo lainnya',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          //Terbaru / jatuh tempo
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Terbaru/Jatuh tempo',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bpjs.png',
                        'BPJS Kesehatan',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_multitrip.png',
                        'Kartu Multi Trip',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_pdam.png',
                        'PDAM',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_pbb.png',
                        'PBB',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Isi ulang
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Isi ulang',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_pln.png',
                        'PLN token',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_emoney.png',
                        'Money e-money',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_tapcash.png',
                        'BNI TapCash',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_telkomsel.png',
                        'Telkomsel hemat lengkap',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Tagihan rumah tangga
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Tagihan rumah tangga',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bpjs.png',
                        'BPJS',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_pgn.png',
                        'PGN Gas',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_telkom.png',
                        'Telkom',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_pendidikan.png',
                        'Pendidikan',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // KOmunikasi
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Komunikasi',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_telkomselhalo.png',
                        'Telkomsel Halo',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_xl.png',
                        'XL Pascabayar',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_indihome.png',
                        'Indihome',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_myrepublic.png',
                        'My Republic',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          //gopay
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Pembayaran e-commerce',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_zalora.png',
                        'Zalora',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_bukalapak.png',
                        'Bukalapak',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_sociolla.png',
                        'Sociolla',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          //gopay
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'GoPay Later & GoPay Pinjam',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_gopaylater.png',
                        'GoPay Later',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_gopaypinjam.png',
                        'GoPay Pinjam',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bpkb.png',
                        'Pinjam BPKB',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Cicilan
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Cicilan',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_homecredit.png',
                        'Home Credit Indonesia',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bfi.png',
                        'BFI',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_kartukredit.png',
                        'Kartu Kredit',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_adira.png',
                        'Adira Finance',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Streaming
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Streaming',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_spotify.png',
                        'Spotify',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_vidio.png',
                        'Vidio',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_viu.png',
                        'Viu',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_primevideo.png',
                        'Prime Video',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Layanan publik
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Layanan publik',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_pbb.png',
                        'PBB',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_signal.png',
                        'Signal',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_mpn.png',
                        'Penerimaan Negara',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_passport.png',
                        'Paspor',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Asuransi
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Asuransi',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_shield.png',
                        'GoPay Asuransi',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bpjs.png',
                        'BPJS',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_bpjsketenagakerjaan.png',
                        'BPJS Ketenagakerjaan',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_prudential.png',
                        'Prudential',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Zakat & donasi
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Zakat & donasi',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_rumahyatim.png',
                        'Rumah Yatim',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_gray.png',
                        'Griya Yatim dan Dhuafa',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_baznas.png',
                        'BAZNAS',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_dompetdhuafa.png',
                        'Dompet Dhuafa',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // Voucher game
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Voucher game',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF000000),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Spacer(),
                      ButtonLihatsemua(onTap: () => ()),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/pembayaran_googleplay.png',
                        'Kode Voucher Google Play',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_unipin.png',
                        'Kode Voucher Unipin',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_ml.png',
                        'Mobile Legends Codashop Voucher',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_ff.png',
                        'Free Fire Codashop Voucher',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          // On-demand & e-commerce
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'On-demand & e-commerce',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildRecommendationItem(
                        context,
                        'assets/logo_tokopedia.png',
                        'Tokopedia',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_tiktokshop.png',
                        'ShopTokopedia',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_goride.png',
                        'GoRide',
                      ),
                      _buildRecommendationItem(
                        context,
                        'assets/logo_gofood.png',
                        'GoFood',
                      ),
                    ],
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

Widget _buildRecommendationItem(
  BuildContext context,
  String imagePath,
  String title,
) {
  final itemWidth = (MediaQuery.of(context).size.width - 70) / 4;

  return Container(
    width: itemWidth,
    child: Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFEDEDED), width: 1),
          ),
          child: Center(
            child: Image.asset(
              imagePath,
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(height: 7),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
          textAlign: TextAlign.center,
          maxLines: title.length > 12 ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

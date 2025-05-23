import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailLayananfavWarga extends StatelessWidget {
  const DetailLayananfavWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_rounded,
                size: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                    'Game',
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _buildLayananFavWarga(
                            context,
                            'assets/logo_jolibox.png',
                            'Jolibox Games',
                          ),
                          _buildLayananFavWarga(
                            context,
                            'assets/logo_majamojo.png',
                            'Majamojo',
                          ),
                          _buildLayananFavWarga(
                            context,
                            'assets/logo_tagtag.png',
                            'TagTag',
                          ),
                          _buildLayananFavWarga(
                            context,
                            'assets/logo_mgames.png',
                            'Mgames',
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_giftarena.png',
                        'GG Gift Arena',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                    'Hiburan',
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
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_jolibox.png',
                        'Jolibox Drama',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_ceritariri.png',
                        'Cerita Riri',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_langitmusik.png',
                        'Langit Musik',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                    'Zakat & donasi',
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
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_baznas.png',
                        'BAZNAS',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_raheela.png',
                        'Rahelaa Project',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_kitabisa.png',
                        'Kitabisa',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                    'Keperluan Sehari-hari',
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
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_masjid.png',
                        'Sholat & Quran',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_populix.png',
                        'Populix Survei',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_ubox.png',
                        'Ubox',
                      ),
                      _buildLayananFavWarga(
                        context,
                        'assets/logo_paysgift.png',
                        'Paysgift',
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

  Widget _buildLayananFavWarga(
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
}

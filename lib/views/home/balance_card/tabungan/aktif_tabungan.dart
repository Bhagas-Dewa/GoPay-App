import 'dart:ui';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/balancecard_controller.dart';

class AktifTabungan extends StatefulWidget {
  AktifTabungan({super.key});

  @override
  State<AktifTabungan> createState() => _AktifTabunganState();
}

class _AktifTabunganState extends State<AktifTabungan> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  final BalancecardController controller = Get.find<BalancecardController>();

  final List<Map<String, dynamic>> _comparisonItems = [
    {
      'title': 'Gratis top up s.d 5x perbulan',
      'hasTick': true,
      'hasCross': false,
    },
    {'title': 'Bunga 2.5 %', 'hasTick': true, 'hasCross': false},
    {
      'title': 'Gratis transfer ke semua bank',
      'hasTick': true,
      'hasCross': false,
    },
    {
      'title': 'Gratis biaya pembayaran di Bibit',
      'hasTick': true,
      'hasCross': false,
    },
    {'title': 'Saldo tak terbatas', 'hasTick': true, 'hasCross': false},
    {
      'title': 'Gampang top up dengan banyak cara',
      'hasTick': true,
      'hasCross': false,
    },
    {
      'title': 'Bayar semua kebutuhan kapan & di mana aja',
      'hasTick': true,
      'hasCross': false,
    },
    {'title': 'Gak perlu minimal saldo', 'hasTick': true, 'hasCross': false},
    {'title': 'Gratis biaya admin bulanan', 'hasTick': true, 'hasCross': false},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset > 60 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 60 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset('assets/banner_tabungan.png', fit: BoxFit.cover),
          ),

          // Main content yang scrollable dengan notch
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (
              BuildContext context,
              bool innerBoxIsScrolled,
            ) {
              return [SliverToBoxAdapter(child: SizedBox(height: 175))];
            },
            body: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildUpperContent(),
                SizedBox(height: 203),
                _buildMainContent(),
              ],
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: AnimatedOpacity(
              opacity: _isScrolled ? 0.0 : 1.0,
              duration: Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.close, size: 24),
                  onPressed: () => Get.back(),
                ),
              ),
            ),
          ),

          // App bar yang muncul ketika discroll
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: _isScrolled ? 80 : 0,
            child:
                _isScrolled
                    ? ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.white.withOpacity(0.5), 
                          child: SafeArea(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () => Get.back(),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'GoPay Tabungan by Jago',
                                    style: GoogleFonts.inter(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: -0.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFFDFDFD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, -1),
              spreadRadius: 1,
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
            'Oke, Mulai!',
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

  Widget _buildUpperContent() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildTabBar(),

        Positioned(top: 75, left: 0, right: 0, child: _buildGopayTabungan()),

        Positioned(
          top: 285,
          left: 0,
          right: 0,
          child: Container(
            height: 18,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              border: BorderDirectional(
                bottom: BorderSide(color: Color(0xFFEEEFF3), width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 100,
      padding: EdgeInsets.only(top: 12, left: 20, right: 20, bottom: 40),
      decoration: BoxDecoration(
        color: Color(0xFFEEEFF3),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: inset.BoxDecoration(
          color: Color(0XFFE2E5EA),
          borderRadius: BorderRadius.circular(45),
          boxShadow: [
            inset.BoxShadow(
              inset: true,
              offset: Offset(-2, 2),
              blurRadius: 4,
              color: Color(0xFFC0C5C9).withOpacity(0.4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 6),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFCFD2D7), Color(0xFFB6BDC5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.2, 0.8],
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text(
                'Tabungan',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 21),
              child: Text(
                'Tabungan Syariah',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGopayTabungan() {
    return Container(
      padding: EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0XFFFDFDFD), Color(0xFFE1E2E4)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 0.8],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/circleicon_moneybag.png', height: 18),
              SizedBox(width: 5),
              Text(
                'gopay tabungan',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.1,
                  height: 0.8,
                ),
              ),
              SizedBox(width: 4),
              Text(
                'by',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(width: 2),
              Text(
                'Jago',
                style: GoogleFonts.lora(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Upgrade biar bisa dapet bunga dan gratis transfer ke mana pun.',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
                  child: Image.asset('assets/simpanan_spark.png', height: 65),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/simpanan_karung.png', height: 28),
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
                        border: Border.all(color: Color(0xffE2E5EA), width: 1),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.help_rounded, size: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: inset.BoxDecoration(
        color: Color(0XFFFDFDFD),
        boxShadow: [
          inset.BoxShadow(
            inset: true,
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 4,
            color: Color(0xFFC0C5C9).withOpacity(0.1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/icon_moneyhand.png', height: 18),
              SizedBox(width: 10),
              Text(
                'Upgrade sekarang biar bisa dapetin:',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          _buildMaksimalBunga(),
          _buildTable(),

          SizedBox(height: 20),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashColor: Color(0xFFEEEFF3),
            direction: Axis.horizontal,
            lineLength: double.infinity,
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/pengaturan_protect2.png', height: 24),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'GoPay Tabungan by Jago adalah produk Tabungan Bank Jago yang bekerja sama dengan GoPay. PT Bank Jago Tbk berizin dan diawasi oleh Otoritas Jasa Keuangan (OJK) dan Bank Indonesia, serta merupakan peserta penjaminan LPS.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),
          DottedLine(
            dashLength: 4,
            lineThickness: 1,
            dashColor: Color(0xFFEEEFF3),
            direction: Axis.horizontal,
            lineLength: double.infinity,
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/pengaturan_iconprivasi.png', height: 24),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  'Saya dengan ini memahami, menyetujui, dan memberikan persetujuan kepada Bank Jago untuk memperoleh, mengumpulkan, memproses, dan menganalisis data pribadi dan informasi saya. Hal ini dilakukan untuk tujuan menawarkan dan menyediakan layanan dan/atau produk dari Bank Jago kepada saya, termasuk namun tidak terbatas pada produk pinjaman.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildMaksimalBunga() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFEEEFF3), width: 1),
        ),
        child: Row(
          children: [
            Image.asset('assets/icon_diskonup.png', height: 20),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Buat maksimalin bungamu, saldo GoPay bakal ditransfer ke GoPay Tabgungan begitu di-upgrade',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable() {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: inset.BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Color(0xFFEEEFF3), width: 1),
            boxShadow: [
              inset.BoxShadow(
                inset: true,
                offset: Offset(0, 1),
                blurRadius: 3,
                spreadRadius: 3,
                color: Color(0xFFC0C5C9).withOpacity(0.1),
              ),
            ],
          ),
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      'Keuntungan',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Image.asset('assets/icon_moneybag.png', height: 14),
                        SizedBox(width: 2),
                        Text(
                          'Tabungan',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        Image.asset('assets/promoitem_dompet.png', height: 10),
                        SizedBox(width: 4),
                        Text(
                          'Saldo',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(color: Color(0xFFEEEFF3), thickness: 1.5),
              ),

              for (int i = 0; i < _comparisonItems.length; i++) ...[
                _buildTableRow(
                  _comparisonItems[i]['title'],
                  _comparisonItems[i]['hasTick'],
                  _comparisonItems[i]['hasCross'],
                ),
                if (i < _comparisonItems.length - 1)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: Color(0xFFEEEFF3), thickness: 1.5),
                  ),
              ],
            ],
          ),
        ),

        Positioned(
          top: 10,
          bottom: 10,
          left: 143,
          child: Container(
            width: 105,
            decoration: BoxDecoration(
              // color: Color(0xFF50BDD2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFF50BDD2), width: 1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Color(0xFF50BDD2).withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTableRow(String title, bool hasTick, bool hasCross) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
        ),
        SizedBox(width: 50),
        Icon(
          hasTick ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: hasTick ? Color(0xFF088C15) : Color(0XFFD02E3D),
          size: 18,
        ),
        SizedBox(width: 80),
        Icon(
          hasCross ? Icons.check_circle_rounded : Icons.cancel_rounded,
          color: hasCross ? Color(0xFF088C15) : Color(0XFFD02E3D),
          size: 18,
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

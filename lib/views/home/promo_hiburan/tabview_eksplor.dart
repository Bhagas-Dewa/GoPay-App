import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/promo_item_model.dart';
import 'package:gopay_task/widgets/button_lihatlainnya.dart';
import 'package:gopay_task/widgets/dottedline_curve.dart';
import 'package:gopay_task/widgets/promo_bannersection.dart';
import 'package:gopay_task/widgets/promo_withbutton.dart';
import 'package:gopay_task/widgets/promo_withoutbutton.dart';

class TabviewEksplor extends StatefulWidget {
  const TabviewEksplor({super.key});

  @override
  State<TabviewEksplor> createState() => _TabviewEksplorState();
}

class _TabviewEksplorState extends State<TabviewEksplor> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Banner promo sebagai sliver
        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Banner
              Image.asset(
                'assets/banner_promo.png',
                height: 315,
                width: double.infinity,
                fit: BoxFit.fill,
              ),

              Positioned(
                top: 280,
                left: 0,
                right: 0,
                child: _buildVoucherLocation(),
              ),
            ],
          ),
        ),

        // Jarak setelah stack
        SliverToBoxAdapter(child: SizedBox(height: 210)),

        SliverToBoxAdapter(child: _buildListHorizontal()),
        SliverToBoxAdapter(child: SizedBox(height: 20)),
        SliverToBoxAdapter(child: _buildBaru()),
        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithbutton(
            title: 'Promo Spesial untuk Pengguna Baru',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_ml.png',
                title: 'Google Play - MLBB - Cashback maks. 30rb',
                minPayment: 'Min. bayar 10rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_ff.png',
                title: 'Google Play - Free Fire - Cashback maks. 30rb',
                minPayment: 'Min. bayar 10rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_gopay.png',
                title: 'GoPay Games MLBB - GRATIS* WDP',
                minPayment: 'Min. bayar 26.6rb',
              ),
            ],
            buttonText: 'Lihat promo lainnya',
            buttonIconAsset: 'assets/iconbutton_promo.png',
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 35)),
        SliverToBoxAdapter(child: _buildPromoBrandPopuler()),
        SliverToBoxAdapter(child: SizedBox(height: 35)),
        SliverToBoxAdapter(child: BannerSection()),
        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithbutton(
            title: 'Borong kebutuhan harian',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_indomart.png',
                title: 'Indomaret - Minyak Murah - Cashback 2rb',
                minPayment: 'Min. bayar 35rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_indomart.png',
                title: 'Indomaret - Plaing Murah - Cashback 2 rb',
                minPayment: 'Min. bayar 15rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_alfamart.png',
                title: 'Alfamart - Minyak Fair - Cashback 2rb',
                minPayment: 'Min. bayar 35rb',
              ),
            ],
            buttonText: 'Lihat promo lainnya',
            buttonIconAsset: 'assets/iconbutton_promo.png',
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithoutButton(
            title: 'Belanja kebutuhan dari mana aja',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_alfagift.png',
                title: 'Alfagift - Cashback 10rb',
                minPayment: 'Min. bayar 100rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_indomaretklik.png',
                title: 'Klik Indomaret - Cashback 10rb',
                minPayment: 'Min. bayar 100rb',
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithbutton(
            title: 'Promo pilihan buat game & aplikasi',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_ml.png',
                title: 'Google Play - MLBB - Cashback maks. 30rb',
                minPayment: 'Min. bayar 10rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_ff.png',
                title: 'Google Play - Free Fire - Cashback maks. 30rb',
                minPayment: 'Min. bayar 10rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_gopay.png',
                title: 'GoPay Games MLBB - GRATIS* WDP',
                minPayment: 'Min. bayar 26.6rb',
              ),
            ],
            buttonText: 'Lihat promo lainnya',
            buttonIconAsset: 'assets/iconbutton_promo.png',
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithbutton(
            title: 'Tetap terhubung sama orang terdekat',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_smartfren.png',
                title: 'mySF - Cashback maks. 10rb',
                minPayment: 'Min. bayar 20rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_xlbiru.png',
                title: 'myXL - Paket Data - Cashback maks. 10rb',
                minPayment: 'Min. bayar 20rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_xl.png',
                title: 'XL Prioritas - Cashback maks. 10rb',
                minPayment: 'Tanpa min. bayar',
              ),
            ],
            buttonText: 'Lihat promo lainnya',
            buttonIconAsset: 'assets/iconbutton_promo.png',
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 35)),

        SliverToBoxAdapter(
          child: PromoWithbutton(
            title: 'Jalan-jalan lebih irit pake GoPay!',
            promoItems: [
              PromoItemModel(
                logoAsset: 'assets/logo_securep.png',
                title: 'Secure Parking - Cashback maks. 5rb',
                minPayment: 'Min. bayar 20rb',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_mrtjkt.png',
                title: 'MRT Jakarta - Cashback maks. 14rb',
                minPayment: 'Tanpa min. bayar',
              ),
              PromoItemModel(
                logoAsset: 'assets/logo_shell.png',
                title: 'Shell - Cashback maks. 5rb',
                minPayment: 'Min. bayar 50rb',
              ),
            ],
            buttonText: 'Lihat promo lainnya',
            buttonIconAsset: 'assets/iconbutton_promo.png',
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 80)),
        SliverToBoxAdapter(child: _buildFooter()),
        SliverToBoxAdapter(child: SizedBox(height: 100)),
      ],
    );
  }

  Widget _buildVoucherLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0XFFFDFDFD),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 24,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Lokasi kamu',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Text(
                        'Taman Jemursari Selatan 1 no. 23',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: const Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE6E7E9), Color(0xFFF1F2F4)],
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded, size: 24, color: Colors.black),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Cari promo',
                          hintStyle: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                            fontWeight: FontWeight.w300,
                          ),
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                        ),
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: DottedLineWithCurves(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFEDEDED), width: 1),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/promo_voucher1.png', height: 18),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Voucher',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '4 Tersedia',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xFF626E7A),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xFFEDEDED), width: 1),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset('assets/promo_voucher2.png', height: 18),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Paket Voucher',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Colors.black,
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Beli sekarang!',
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: const Color(0xFF626E7A),
                                  letterSpacing: -0.3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListHorizontal() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: promoItems.length,
        itemBuilder: (context, index) {
          final item = promoItems[index];
          return Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: Image.asset(item.imagePath, height: 20),
                ),
                SizedBox(height: 8),
                SizedBox(
                  width: 75,
                  child: Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBaru() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Baru',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 30),
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'assets/logo_paysgift.png',
                      height: 35,
                      width: 35,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  '   Paysgift',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF626E7A),
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

  Widget _buildPromoBrandPopuler() {
    Widget buildBrandItem(String imagePath, String brandName) {
      return Container(
        width: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              brandName,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Color(0xFF626E7A),
                letterSpacing: -0.3,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
    }

    final List<Map<String, String>> brands = [
      {'image': 'assets/logo_lapakgaming.png', 'name': 'Lapakgaming'},
      {
        'image': 'assets/pembayaran_googleplay.png',
        'name': 'Google Play Store',
      },
      {'image': 'assets/logo_gopay.png', 'name': 'GoPay Games'},
      {'image': 'assets/logo_smartfren.png', 'name': 'My Smartfren'},

      {'image': 'assets/logo_xl.png', 'name': 'XL Prioritas'},
      {'image': 'assets/logo_im3.png', 'name': 'My IM3'},
      {'image': 'assets/logo_xlbiru.png', 'name': 'XL'},
      {'image': 'assets/logo_axis.png', 'name': 'AxisNet'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Promo oke dari brand populer',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      brands
                          .sublist(0, 4)
                          .map(
                            (brand) =>
                                buildBrandItem(brand['image']!, brand['name']!),
                          )
                          .toList(),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      brands
                          .sublist(4, 8)
                          .map(
                            (brand) =>
                                buildBrandItem(brand['image']!, brand['name']!),
                          )
                          .toList(),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ButtonLihatlainnya(
                    text: 'Lihat brand lainnya',
                    iconAssetPath: 'assets/iconbutton_shop.png',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_globe.png',
            height: 30,
          ),
          SizedBox(height: 10),
          Text(
            'Semua promo udah kamu lihat',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2),
          Text(
            'Udah tau mau promo yang mana? Buruan pake sebelum keabisan.',
            style: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFF626E7A),
              letterSpacing: -0.3,
              height: 1.15
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PromoItem {
  final String imagePath;
  final String title;

  PromoItem({required this.imagePath, required this.title});
}

final List<PromoItem> promoItems = [
  PromoItem(imagePath: 'assets/promo_reward.png', title: 'A+ Rewards'),
  PromoItem(
    imagePath: 'assets/promoitem_makanan.png',
    title: 'Makanan dan Minuman',
  ),
  PromoItem(
    imagePath: 'assets/promoitem_kebutuhan.png',
    title: 'Kebutuhan harian',
  ),
  PromoItem(imagePath: 'assets/promoitem_bills.png', title: 'Tagihan & pulsa'),
  PromoItem(imagePath: 'assets/promoitem_belanja.png', title: 'Belanja'),
  PromoItem(
    imagePath: 'assets/promoitem_transportasi.png',
    title: 'Transportasi',
  ),
  PromoItem(imagePath: 'assets/promoitem_game.png', title: 'Game & aplikasi'),
  PromoItem(imagePath: 'assets/promoitem_hiburan.png', title: 'Hiburan'),
  PromoItem(imagePath: 'assets/promoitem_keluarga.png', title: 'Keluarga'),
  PromoItem(imagePath: 'assets/promoitem_logistik.png', title: 'Logistik'),
  PromoItem(imagePath: 'assets/promoitem_dompet.png', title: 'Keuangan'),
];

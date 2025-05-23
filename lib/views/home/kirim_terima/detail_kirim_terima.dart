import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/kirimterima_controller.dart';
import 'package:gopay_task/views/home/kirim_terima/tabview_actterakhir.dart';
import 'package:gopay_task/views/home/kirim_terima/tabview_akunlainnya.dart';
import 'package:gopay_task/views/home/kirim_terima/tabview_undang.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class DetailKirimTerima extends StatefulWidget {
  const DetailKirimTerima({super.key});

  @override
  State<DetailKirimTerima> createState() => _DetailKirimTerimaState();
}

class _DetailKirimTerimaState extends State<DetailKirimTerima> {
  final KirimTerimaController controller = Get.put(KirimTerimaController());
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              backgroundColor:
                  controller.isScrolled.value
                      ? Color(0xFFEEEFF3)
                      : Colors.transparent,
              pinned: true,
              floating: false,
              snap: false,
              toolbarHeight: 56,
              collapsedHeight: 56,
              automaticallyImplyLeading: false,
              expandedHeight: controller.isScrolled.value ? 56 : 80,
              flexibleSpace:
                  controller.isScrolled.value
                      ? null
                      : FlexibleSpaceBar(
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0Xff93DAEC), Color(0XFFCACEE8)],
                              stops: [0.2, 0.9],
                            ),
                          ),
                        ),
                      ),
              title: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
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
                      const SizedBox(width: 15),
                      Text(
                        'Kirim & terima',
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.help_rounded, size: 24, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),

            // White section with horizontal padding
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0Xff93DAEC), Color(0XFFCACEE8)],
                    stops: [0.2, 0.9],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    height: 72,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/photo_profile.png', height: 40),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Bhagas',
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
                                  size: 18,
                                  color: Color(0XFF01AED6),
                                ),
                              ],
                            ),
                            Text(
                              'GoPay +61812345678, ShopeePay *6746',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF626E7A),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                height: 2,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Container(color: const Color(0xFFEEEFF3)),
                    ),

                    // Kurva putih dengan clipper
                    Positioned(
                      top: -15,
                      left: 0,
                      right: 0,
                      height: 40,
                      child: ClipPath(
                        clipper: WaveClipper(),
                        child: Container(color: Colors.white),
                      ),
                    ),

                    // Border pada kurva
                    Positioned(
                      top: -15,
                      left: 0,
                      right: 0,
                      height: 40,
                      child: CustomPaint(
                        painter: WavePainter(
                          dottedLineOffset: 8.0,
                          drawShadow: true,
                        ),
                        size: Size(MediaQuery.of(context).size.width, 40),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                color: Color(0xFFEEEFF3),
                child: IndexedStack(
                  index: _selectedTabIndex,
                  children: [
                    // Tab 1: Aktivitas terakhir
                    TabviewActterakhir(),

                    // Tab 2: Akun lainnya
                    TabviewAkunlainnya(),

                    // Tab 3: Undang
                    TabviewUndang(),
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: Colors.white,
        height: 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTab("Aktivitas terakhir", 0),
                _buildTab("Akun lainnya", 1),
                _buildTab("Undang", 2),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFE6E7E9), Color(0XFFF1F2F4)],
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.search_rounded, size: 26, color: Colors.black),
                  SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Ketik nama atau nomor HP',
                        hintStyle: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                      ),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                      onChanged: (value) {
                        // Pindah ke tab Undang saat mulai mengetik
                        if (_selectedTabIndex != 2) {
                          setState(() {
                            _selectedTabIndex = 2;
                          });
                        }
                      },
                    ),
                  ),
                  // Tampilkan tombol hapus jika ada teks
                  Obx(() => controller.searchText.value.isNotEmpty
                    ? GestureDetector(
                        onTap: () => controller.searchController.clear(),
                        child: Icon(Icons.close, size: 20, color: Colors.black),
                      )
                    : SizedBox.shrink()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildTab(String text, int index) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: isSelected ? Color(0XFF0A7F16) : Colors.grey.shade200,
            width: 1.2,
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
            color: isSelected ? Color(0XFF0A7F16) : Colors.black,
          ),
        ),
      ),
    );
  }
}

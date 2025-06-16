import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/bantuan/bantuan_page.dart';


class ListHadiah extends StatefulWidget {
  const ListHadiah({super.key});

  @override
  State<ListHadiah> createState() => _ListHadiahState();
}

class _ListHadiahState extends State<ListHadiah> {
  late final PageController _pageController;
  int _currentPage = 5000; 
  late final List<Widget> _cards;

  final List<List<Color>> _backgroundGradients = [
    [Color(0xFF77D1E9), Color(0xFFEEEFF3)], 
    [Color(0xFFE79798), Color(0xFFEEEFF3)], 
    [Color(0xFFF3E783), Color(0xFFEEEFF3)], 
  ];

  @override
  void initState() {
    super.initState();
    _cards = [
      _buildCard1(),
      _buildCard2(),
      _buildCard3(),
    ];
    
    _pageController = PageController(
      viewportFraction: 0.65,
      initialPage: _currentPage,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _backgroundGradients[_currentPage % _cards.length],
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: 10000,
              itemBuilder: (context, index) {
                final cardIndex = index % _cards.length;
                double scale = _currentPage == index ? 1.2 : 0.80;
            
                return TweenAnimationBuilder(
                  tween: Tween(begin: scale, end: scale),
                  duration: const Duration(milliseconds: 350),
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: child,
                    );
                  },
                  child: _cards[cardIndex],
                );
              },
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),

            Positioned(
              top: 50,
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
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_rounded, size: 24),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => BantuanPage()),
                    child: Container(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _pageController.previousPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0XFFFDFDFD),
                  border: Border.all(color: Color(0XFFE2E5EA), width: 1),
                ),
                child: Icon(Icons.arrow_back_ios, size: 18, color: Colors.black),
              ),
            ),
            SizedBox(width: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              width: 176,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                  stops: [0.2, 1.0],
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text(
                'Pilih tema',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0XFFFDFDFD),
                  border: Border.all(color: Color(0XFFE2E5EA), width: 1),
                ),
                child:
                    Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard1() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/sticker_giveaway.png', height: 300),
          SizedBox(height: 25),
          Text(
            'Giveaway',
            style: GoogleFonts.lora(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard2() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/sticker_angpaosatuan.png', height: 300),
          SizedBox(height: 25),
          Text(
            'Angpao',
            style: GoogleFonts.lora(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard3() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/sticker_ultah.png', height: 300),
          SizedBox(height: 25),
          Text(
            'Ulang Tahun',
            style: GoogleFonts.lora(
              fontSize: 24,
              color: Colors.black,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
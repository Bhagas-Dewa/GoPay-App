import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
   final PageController _pageController = PageController(
    viewportFraction: 0.88, 
  );
  int _currentPage = 0;
  
  final List<String> bannerImages = [
    'assets/banner1.png',
    'assets/banner2.png',
    'assets/banner3.png',
    'assets/banner4.png',
    'assets/banner5.png',
    'assets/banner6.png',
    'assets/banner4.png',
    'assets/banner1.png',
  ];

  @override
  void initState() {
    super.initState();
    // Optional: Auto-scroll the banners
    /*
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    */
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header text
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pengen hemat? Sini, merapat~',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                'Hanya di aplikasi GoPay mau bayar apa pun jadi lebih hemat!',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: const Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        
        // Banner PageView
        Container(
          height: 180, 
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: bannerImages.length,
            padEnds: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    bannerImages[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        
        // Indicator dots
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 20, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildPageIndicator(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    
    for (int i = 0; i < bannerImages.length; i++) {
      indicators.add(
        Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == _currentPage 
                ? Color(0xFF088C15)
                : Color(0xFFC0C5C9), 
          ),
        ),
      );
    }
    
    return indicators;
  }
}
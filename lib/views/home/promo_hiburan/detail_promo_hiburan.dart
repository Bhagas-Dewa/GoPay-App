// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/home/promo_hiburan/tabview_belivoucher.dart';
import 'package:gopay_task/views/home/promo_hiburan/tabview_eksplor.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';
import 'package:gopay_task/widgets/dottedline_curve.dart';

class DetailPromoHiburan extends StatefulWidget {
  const DetailPromoHiburan({super.key});

  @override
  State<DetailPromoHiburan> createState() => _DetailPromoHiburanState();
}

class _DetailPromoHiburanState extends State<DetailPromoHiburan> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        title: 'Promo',
        rightIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: Color(0XFFF8F8F8),
            border: Border.all(color: Colors.grey.shade300, width: 1),
          ),
          child: Row(
            children: [
              Image.asset('assets/qris_unlimited_coins.png', height: 14),
              SizedBox(width: 4),
              Text(
                'Coins',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(width: 3),
              Text(
                '0',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF626E7A),
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ),
      ),
      body:
          _selectedTabIndex == 0
              ? Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0,
                    ),
                    child: const TabviewEksplor(),
                  ),
                  Positioned(top: 0, left: 0, right: 0, child: _buildTabView()),
                ],
              )
              : Column(
                children: [
                  _buildTabView(),
                  Expanded(
                    child: const TabviewBelivoucher()),
                ],
              ),
    );
  }

  Widget _buildTabView() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: Color(0XFFE2E5EA),
        ),
        child: Row(
          children: [
            // Eksplor tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient:
                        _selectedTabIndex == 0
                            ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                              stops: [0.0, 1.0],
                            )
                            : null,
                    color: _selectedTabIndex == 0 ? null : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.explore,
                        size: 18,
                        color:
                            _selectedTabIndex == 0
                                ? Colors.white
                                : Colors.grey[700],
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Eksplor',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color:
                              _selectedTabIndex == 0
                                  ? Colors.white
                                  : Colors.grey[700],
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Beli voucher tab
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedTabIndex = 1;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient:
                        _selectedTabIndex == 1
                            ? LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                              stops: [0.0, 1.0],
                            )
                            : null,
                    color: _selectedTabIndex == 1 ? null : Colors.transparent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_bag_rounded,
                        size: 18,
                        color:
                            _selectedTabIndex == 1
                                ? Colors.white
                                : Colors.grey[700],
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Beli voucher',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                          color:
                              _selectedTabIndex == 1
                                  ? Colors.white
                                  : Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

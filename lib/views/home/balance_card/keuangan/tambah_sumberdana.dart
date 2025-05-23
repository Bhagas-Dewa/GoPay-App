import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class TambahSumberdana extends StatefulWidget {
  const TambahSumberdana({super.key});

  @override
  State<TambahSumberdana> createState() => _TambahSumberdanaState();
}

class _TambahSumberdanaState extends State<TambahSumberdana> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Tambah metode'),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 85,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/logo_bankjago.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bank Jago',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Hubungkan rek. Bank Jago kamu',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 65),
            child: Container(
              height: 85,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/circletopup_kartu.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kartu debit atau kredit',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Visa, Mastercard, AMEX, dan JCB',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 130),
            child: Container(
              height: 85,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/logo_linkaja.png', height: 28),
                  SizedBox(width: 10),
                  Text(
                    'Link aja',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),


          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 195),
            child: Container(
              height: 85,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/circleicon_oneklik.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BCA Oneklik',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Tambah kartu debit BCA',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 260),
            child: Container(
              height: 85,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/circletopup_bri.png', height: 28),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BRI Direct Debit',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                      Text(
                        'Terima kartu Mastercard & GPN',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 325),
            child: Container(
              height: 65,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 6,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Color(0XFFFDFDFD),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: Offset(0, -3),
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.asset('assets/circletopup_blu.png', height: 28),
                  SizedBox(width: 10),
                  Text(
                    'BLU By BCA Digital',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF088C15),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),

          Container(
          padding: EdgeInsets.only(top: 390),
          height: 0,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(child: Container(color: const Color(0xFFEEEFF3))),

              // Kurva putih dengan clipper
              Positioned(
                top: -15,
                left: 20,
                right: 20,
                height: 35,
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
                height: 33,
                child: CustomPaint(
                  painter: WavePainter(dottedLineOffset: 8.0, drawShadow: true),
                  size: Size(MediaQuery.of(context).size.width, 40),
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

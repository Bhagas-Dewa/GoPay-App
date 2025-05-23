import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gopay_task/views/pengaturan/pengaturan_page.dart';
import 'package:gopay_task/views/scanqris/scan_qris_page.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFEEEFF3).withOpacity(0.1),
            Color(0xFFD7D7D7).withOpacity(0.2),
            Colors.black.withOpacity(0.2),
          ],
          stops: [0.1, 0.3, 0.8],
        ),
      ),
      height: 80,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFD7D7D7),
                      Color(0XFFCCCCCC),
                    ],
                    stops: [0.4, 0.7, 0.9],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(1),
                      spreadRadius: 1, // Penyebaran shadow
                      blurRadius: 10, // Blur radius
                      offset: Offset(0, -10),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // QRIS Button
          Positioned(bottom: 5, child: _buildQrisButton()),
        ],
      ),
    );
  }

  Widget _buildQrisButton() {
    return GestureDetector(
      onTap: () {
        Get.to(() => ScanQrisPage());
        print('button qris dipencettt');
      },
      child: Container(
        height: 60,
        width: 210,
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFF6F6F6),
              Color(0xFFD7D7D7),
              Color(0XFFCCCCCC),
            ],
            stops: [0.4, 0.5, 0.8, 0.9],
          ),
          shape: QRISButtonShape(),
        ),
        child: Center(
          child: Image.asset('assets/button_qris.png', height: 50, width: 110),
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top left
    path.moveTo(0, 25); // Reduced initial vertical offset

    // Create curve at the top with less height
    path.quadraticBezierTo(
      size.width / 2, // Control point x
      -15, // Reduced vertical control point (less height)
      size.width, // End point x
      25, // Matched starting point
    );

    // Draw line to bottom right
    path.lineTo(size.width, size.height);

    // Draw line to bottom left
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class QRISButtonShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    // Hitung lebar dan titik tengah
    final width = rect.width;
    final halfWidth = width / 2;

    return Path()
      // Mulai dari kiri atas dengan sedikit jarak
      ..moveTo(rect.left + 70, rect.top)
      // Kurva ke kiri bawah
      ..quadraticBezierTo(rect.left + 30, rect.top, rect.left, rect.top + 100)
      // Garis ke kanan bawah
      ..lineTo(rect.right, rect.top + 100)
      // Kurva ke kanan atas
      ..quadraticBezierTo(rect.right - 30, rect.top, rect.right - 70, rect.top)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

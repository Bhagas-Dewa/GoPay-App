import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TabviewActterakhir extends StatelessWidget {
  const TabviewActterakhir({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0XFFFDFDFD),
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(color: Colors.white, width: 3)
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aktivitas terakhir',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'Pilih akun buat di transfer dan nikmatin mudahnya lihat riwayat transaksi bareng penerima.',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFFFFFF), Color(0xFFEDEDED)],
                            stops: [0.5, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(color: Color(0xFFEDEDED), width: 1),
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Bhagas',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0XFFE9FFEA),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0XFF0A7F16), width: 0.8),
            ),
            child: Icon(Icons.add, size: 20, color: Color(0XFF0A7F16)),
          ),
        ],
      ),
    );
  }
}

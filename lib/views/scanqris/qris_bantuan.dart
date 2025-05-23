import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';

class QrisBantuan extends StatelessWidget {
  const QrisBantuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(
        title: 'Bantuan',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bagaimana cara bayar dengan QR?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pembayaran dengan scan QR tidak dikenali',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'GoPay saya tidak tersedia di beberapa transaksi/layanan',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),

                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Mengapa tidak bisa bayar setelah salah memasukkan PIN GoPay?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),

                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Transaksi di toko online atau aplikasi lain gagal namun saldo terpotong',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),

                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Transaksi di toko offline gagal namun saldo terpotong',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),

                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Apa yang dapat saya lakukan jika tidak bisa transaksi di Rekan Usaha?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),

                 Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Apa yang dapat saya lakukan jika Rekan Usaha belum terima pembayaran?',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                          softWrap: true,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: Color(0xFF626E7A),
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
}

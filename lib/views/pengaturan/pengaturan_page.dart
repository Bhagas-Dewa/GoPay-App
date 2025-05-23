import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/views/pengaturan/gopay_aman.dart';
import 'package:gopay_task/views/pengaturan/pengaturan_control.dart';
import 'package:gopay_task/views/pengaturan/pengaturan_nilai.dart';
import 'package:gopay_task/views/pengaturan/pengaturan_profile.dart';
import 'package:gopay_task/views/pengaturan/perlindungan_akun.dart';
import 'package:gopay_task/views/pengaturan/privasi_utama.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';

class PengaturanPage extends StatefulWidget {
  const PengaturanPage({super.key});

  @override
  State<PengaturanPage> createState() => _PengaturanPageState();
}

class _PengaturanPageState extends State<PengaturanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(
        title: 'Pengaturan & keamanan',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          PengaturanProfile(),
          SizedBox(height: 20),
          PerlindunganAkun(),
          SizedBox(height: 15),
          PengaturanControl(),
          SizedBox(height: 15),
          GopayAman(),
          SizedBox(height: 15),
          PrivasiUtama(),
          SizedBox(height: 30),
          PengaturanNilai(),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}

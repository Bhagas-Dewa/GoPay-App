import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';

class TopupTunai extends StatefulWidget {
  const TopupTunai({super.key});

  @override
  State<TopupTunai> createState() => _TopupTunaiState();
}

class _TopupTunaiState extends State<TopupTunai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF3),
      appBar: const AppbarPrimary(title: 'Top up pakai uang tunai'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildMinimarketList(),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE6E7E9), Color(0xFFF1F2F4)],
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, size: 26, color: Colors.black),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Cari minimarket',
                hintStyle: GoogleFonts.inter(
                  fontSize: 14,
                  color: const Color(0xFF626E7A),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimarketList() {
    final minimarkets = [
      {'name': 'Alfamart', 'asset': 'assets/circletopup_alfamart.png'},
      {'name': 'Indomart', 'asset': 'assets/circletopup_indomart.png'},
      {'name': 'Lawson', 'asset': 'assets/circletopup_lawson.png'},
      {'name': 'Mitra Tokopedia', 'asset': 'assets/circletopup_mitratokped.png'},
      {'name': 'ATM Bersama', 'asset': 'assets/circletopup_atm.png'},
      {'name': 'Alfamidi', 'asset': 'assets/circletopup_alfamidi.png'},
      {'name': 'Dan+Dan', 'asset': 'assets/circletopup_dandan.png'},
      {'name': 'Pos Indonesia', 'asset': 'assets/circletopup_posindo.png'},
      {'name': 'Pegadaian', 'asset': 'assets/circletopup_pegadaian.png'},
      {'name': 'Bank BPD DIY', 'asset': 'assets/circletopup_bankdiy.png'},
      {'name': 'Bank KB Bukopin - Agent', 'asset': 'assets/circletopup_bukopin.png'},
      {'name': 'Bank KB Bukopin - Branch Office', 'asset': 'assets/circletopup_bukopin.png'},
      {'name': 'Bank Sinarmas', 'asset': 'assets/circletopup_sinarmas.png'},
      {'name': 'BPD Bali - Agent', 'asset': 'assets/circletopup_bpdbali.png'},
      {'name': 'OCBC', 'asset': 'assets/circletopup_ocbc.png'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          for (int i = 0; i < minimarkets.length; i++) ...[
            _buildMinimarketItem(
              name: minimarkets[i]['name']!,
              assetPath: minimarkets[i]['asset']!,
            ),
            if (i < minimarkets.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildMinimarketItem({required String name, required String assetPath}) {
    return Row(
      children: [
        Image.asset(assetPath, height: 40),
        const SizedBox(width: 15),
        Text(
          name,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}

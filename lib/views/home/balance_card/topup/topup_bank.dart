import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';

class TopupBank extends StatefulWidget {
  const TopupBank({super.key});

  @override
  State<TopupBank> createState() => _TopupBankState();
}

class _TopupBankState extends State<TopupBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Top up lewat bank'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildBankList(),
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
                hintText: 'Cari Bank',
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

  Widget _buildBankList() {
    final List<BankItemData> banks = [
      // Bank dengan label gratis
      BankItemData(
        name: 'BRI', 
        imagePath: 'assets/circletopup_bri.png', 
        isFree: true
      ),
      BankItemData(
        name: 'BCA', 
        imagePath: 'assets/circletopup_bca.png',
        isFree: true
      ),
      BankItemData(
        name: 'Mandiri',
        imagePath: 'assets/circletopup_mandiri.png',
        isFree: true,
      ),

      BankItemData(name: 'BNI', imagePath: 'assets/circletopup_bni.png', isFree: true),

      BankItemData(
        name: 'Jago',
        imagePath: 'assets/logo_bankjago.png',
        isFree: true,
      ),

      BankItemData(
        name: 'PermataBank',
        imagePath: 'assets/circletopup_permatabank.png',
        isFree: true,
      ),

      // Bank tanpa label gratis
      BankItemData(
        name: 'CIMB Niaga',
        imagePath: 'assets/circletopup_cimbniaga.png',
        isFree: false,
      ),

      BankItemData(
        name: 'ATM Bersama',
        imagePath: 'assets/circletopup_atm.png',
        isFree: false,
      ),

      BankItemData(
        name: 'ATM Prima',
        imagePath: 'assets/circletopup_prima.png',
        isFree: false,
      ),

      BankItemData(
        name: 'ATM ALTO',
        imagePath: 'assets/circletopup_alto.png',
        isFree: false,
      ),

      BankItemData(
        name: 'BSI',
        imagePath: 'assets/circletopup_bsi.png',
        isFree: false,
      ),

      BankItemData(
        name: 'BTN',
        imagePath: 'assets/circletopup_bankbtn.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Danamon',
        imagePath: 'assets/circletopup_danamon.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Panin Bank',
        imagePath: 'assets/circletopup_paninbank.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Digibank',
        imagePath: 'assets/circletopup_dbs.png',
        isFree: false,
      ),

      BankItemData(
        name: 'OCBC',
        imagePath: 'assets/circletopup_ocbc.png',
        isFree: false,
      ),

      BankItemData(
        name: 'neobank',
        imagePath: 'assets/circletopup_neobank.png',
        isFree: false,
      ),

      BankItemData(
        name: 'UOB',
        imagePath: 'assets/circletopup_uob.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Maybank Indonesia',
        imagePath: 'assets/circletopup_maybank.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank DKI',
        imagePath: 'assets/circletopup_bankdki.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Pos Indonesia',
        imagePath: 'assets/circletopup_posindo.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank BJB',
        imagePath: 'assets/circletopup_dbs.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank BJB Syariah',
        imagePath: 'assets/circletopup_bjbsyariah.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank BDP DIY',
        imagePath: 'assets/circletopup_bankdiy.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank Jatim',
        imagePath: 'assets/circletopup_bankjatim.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank Sinarmas',
        imagePath: 'assets/circletopup_sinarmas.png',
        isFree: false,
      ),

      BankItemData(
        name: 'BPB Bali',
        imagePath: 'assets/circletopup_bpdbali.png',
        isFree: false,
      ),

      BankItemData(
        name: 'Bank KB Bukopin',
        imagePath: 'assets/circletopup_bukopin.png',
        isFree: false,
      ),

    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          for (int i = 0; i < banks.length; i++) ...[
            _buildBankItem(
              name: banks[i].name,
              imagePath: banks[i].imagePath,
              isFree: banks[i].isFree,
            ),

            if (i < banks.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildBankItem({
    required String name,
    required String imagePath,
    required bool isFree,
  }) {
    return Row(
      children: [
        Image.asset(imagePath, height: 40),
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
        SizedBox(width: 10),
        if (isFree)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0XFF088C15), Color(0XFF5DB466)],
                stops: [0.4, 1.0],
              ),
            ),
            child: Text(
              'GRATIS',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.3,
              ),
            ),
          ),
      ],
    );
  }
}


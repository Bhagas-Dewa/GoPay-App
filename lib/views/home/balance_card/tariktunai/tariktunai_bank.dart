import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/appbar_searchbar.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';

class TariktunaiBank extends StatefulWidget {
  const TariktunaiBank({super.key});

  @override
  State<TariktunaiBank> createState() => _TariktunaiBankState();
}

class _TariktunaiBankState extends State<TariktunaiBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppBarSearchBar(
        title: 'Transfer bank',
        searchText: 'Ketik nama bank disini',
        onHelpPressed: () => (),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _buildMainBank(),
          SizedBox(height: 30),
          Text(
            'Semua bank',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 15),
          _buildBankList(),
        ],
      ),
    );
  }

  Widget _buildMainBank() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/logo_bankjago.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'Bank Jago',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_bca.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'BCA',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_mandiri.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'Mandiri',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_bri.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'BRI',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_bni.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'BNI',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_cimbniaga.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'CIMB Niaga',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_permatabank.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'PermataBank',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
          ),

          Row(
            children: [
              Image.asset('assets/circletopup_bsi.png', height: 40),
              const SizedBox(width: 15),
              Text(
                'Bank Syariah Indonesia',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildBankList() {
    final List<BankItemData> banks = [

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

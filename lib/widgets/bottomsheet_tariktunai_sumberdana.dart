import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';

class BottomsheetTariktunaiSumberdana extends StatelessWidget {
  BottomsheetTariktunaiSumberdana({super.key});

  final List<BankItemData> Banks = [
    BankItemData(
      name: 'Kartu debit',
      subtitle: 'Visa & Mastercard',
      imagePath: 'assets/circletopup_kartu.png',
    ),
    BankItemData(
      name: 'BCA OneKlik',
      subtitle: 'Tambahin kartu debit BCA kamu',
      imagePath: 'assets/logo_oneklik.png',
    ),
    BankItemData(
      name: 'Kantong Jago',
      subtitle: 'Hubungkan rek. Bank Jago kamu',
      imagePath: 'assets/logo_bankjago.png',
    ),
    BankItemData(
      name: 'BRI Direct Credit',
      subtitle: 'Terima kartu mastercard & GPN',
      imagePath: 'assets/circletopup_bri.png',
    ),
    BankItemData(
      name: 'blu by BCA Digital',
      subtitle: 'Bayar dari bluAccount',
      imagePath: 'assets/circletopup_blu.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: const Color(0xFFEEEFF3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFFC0C5C9),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Pilih sumber dana',
            style: GoogleFonts.lora(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          Text(
            '   Metode tersedia',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/circleicon_gopay.png', height: 40),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'GoPay',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Sisa saldo: ',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.1,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(0XFFFDFDFD),
                    borderRadius: BorderRadius.circular(45),
                    border: Border.all(color: Color(0xFF0A7F16), width: 1),
                  ),
                  child: Icon(Icons.circle, size: 14, color: Color(0xFF0A7F16)),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),
          Text(
            'Tambah Metode',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              letterSpacing: -0.3,
            ),
          ),

          SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0XFFFDFDFD),
            ),
            child: Column(
              children: List.generate(
                Banks.length,
                (index) => Column(
                  children: [
                    _buildMetodeItem(Banks[index]),
                    if (index != Banks.length - 1)
                      const Padding(
                        padding: EdgeInsets.only(left: 55, top: 8, bottom: 8),
                        child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                      ),
                  ],
                ),
              ),
            ),

          ),
        ],
      ),
    );
  }

  Widget _buildMetodeItem(BankItemData item) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: Image.asset(
              item.imagePath,
              height: 40,
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              Text(
                item.subtitle.toString(),
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF626E7A),
                  letterSpacing: -0.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

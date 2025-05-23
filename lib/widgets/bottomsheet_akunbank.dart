import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';
import 'package:gopay_task/models/bank_item_model.dart';

class BottomsheetAkunbank extends StatelessWidget {
   BottomsheetAkunbank({super.key});

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
    BankItemData(
      name: 'PermataBank Virtual Account',
      subtitle: 'Transfer ke bank lewat virtual account',
      imagePath: 'assets/circletopup_permatabank.png',
    ),
    BankItemData(
      name: 'Mandiri Virtual Account',
      subtitle: 'Transfer ke bank lewat virtual account',
      imagePath: 'assets/circletopup_mandiri.png',
    ),
    BankItemData(
      name: 'BCA Virtual Account',
      subtitle: 'Transfer ke bank lewat virtual account',
      imagePath: 'assets/circletopup_bca.png',
    ),
    BankItemData(
      name: 'BRI Virtual Account',
      subtitle: 'Transfer ke bank lewat virtual account',
      imagePath: 'assets/circletopup_bri.png',
    ),
    BankItemData(
      name: 'BNI Virtual Account',
      subtitle: 'Transfer ke bank lewat virtual account',
      imagePath: 'assets/circletopup_bni.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0xFFEEEFF3),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 4,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Color(0xFFC0C5C9),
                ),
              ),
            ),
            SizedBox(height: 55),
            Text(
              'Tambah Metode',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0XFFFDFDFD),
              ),
              child: Column(
                children: List.generate(
                  Banks.length,
                  (index) => Column(
                    children: [
                      _buildMetodeItem(Banks[index]),
                      if (index != Banks.length - 1)
                        Padding(
                          padding: EdgeInsets.only(left: 55, top: 5, bottom: 5),
                          child: Divider(
                            color: Color(0xFFEEEFF3),
                            thickness: 1,
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

  Widget _buildMetodeItem(BankItemData item) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
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
          SizedBox(width: 15),
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
                  color: Color(0xFF626E7A),
                  letterSpacing: -0.3,
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
    );
  }
}



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/widgets/button_hapus_riwayattransaksi.dart';

class BottomsheetFiltermetode extends StatefulWidget {
  const BottomsheetFiltermetode({super.key});

  @override
  State<BottomsheetFiltermetode> createState() =>
      _BottomsheetFiltermetodeState();
}

class _BottomsheetFiltermetodeState extends State<BottomsheetFiltermetode> {
  bool isChecked = false;
  final HistoryTransactionController _historyTransactionController = Get.find<HistoryTransactionController>();

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
        color: Color(0xFFFDFDFD),
      ),
      child: ListView(
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

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter dari metode',
                style: GoogleFonts.lora(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              ButtonHapusRiwayattransaksi(
                isActive: isChecked,
                onTap: () {
                  _historyTransactionController.resetAllFilters();
                  Get.back();
                }
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Image.asset('assets/circleicon_gopay.png', height: 40),
              SizedBox(width: 20),
              Text(
                'GoPay Saldo',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: isChecked ? Border.all(color: Colors.transparent) : Border.all(color: Color(0XFFC0C5C9)),
                    borderRadius: BorderRadius.circular(6),
                    color: isChecked ? Color(0XFF088C15) : Colors.transparent,
                  ),
                  child: isChecked
                      ? Icon(Icons.check, size: 16, color: Colors.white)
                      : null,
                ),
              ),
            ],
          ),
          SizedBox(height: 420),
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                  stops: [0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(45),
              ),
              child: Text(
                'Pasang Filter',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/widgets/bottomsheet_filterlayanan.dart';
import 'package:gopay_task/widgets/bottomsheet_filtermetode.dart';
import 'package:gopay_task/widgets/bottomsheet_filtertanggal.dart';

class DetailRiwayatTransaksi extends StatefulWidget {
  const DetailRiwayatTransaksi({super.key});

  @override
  State<DetailRiwayatTransaksi> createState() => _DetailRiwayatTransaksiState();
}

class _DetailRiwayatTransaksiState extends State<DetailRiwayatTransaksi> {
  final HistoryTransactionController _historyTransactionController = Get.put(
    HistoryTransactionController(),
  );

  void _showFilterTanggalBottomSheet() {
    Get.bottomSheet(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: BottomsheetFiltertanggal(),
      ),
      isScrollControlled: true,
      enterBottomSheetDuration: Duration(milliseconds: 300),
      exitBottomSheetDuration: Duration(milliseconds: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  void _showFilterLayananBottomSheet() {
    Get.bottomSheet(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.79,
        child: BottomsheetFilterlayanan(),
      ),
      isScrollControlled: true,
      enterBottomSheetDuration: Duration(milliseconds: 300),
      exitBottomSheetDuration: Duration(milliseconds: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  void _showFilterMetodeBottomSheet() {
    Get.bottomSheet(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.8,
        child: BottomsheetFiltermetode(),
      ),
      isScrollControlled: true,
      enterBottomSheetDuration: Duration(milliseconds: 300),
      exitBottomSheetDuration: Duration(milliseconds: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: Color(0xFFEEEFF3),
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 15,
                bottom: 10,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Riwayat Transaksi',
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 22),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildFilterButton(
                        "Tanggal",
                        onTap: _showFilterTanggalBottomSheet,
                      ),

                      _buildFilterButton(
                        "Layanan",
                        onTap: _showFilterLayananBottomSheet,
                      ),

                      _buildFilterButton(
                        "Metode",
                        onTap: _showFilterMetodeBottomSheet,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        final uniqueDates = _historyTransactionController.getUniqueDates();

        return ListView(
          padding: EdgeInsets.symmetric(vertical: 20),
          children: [
            SizedBox(height: 5),
            // Banner promosi
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/sticker_done.png', height: 80),
                SizedBox(width: 5),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0XFF4425FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Keuangan aman, gak boncos lagi',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: -0.3,
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  'Sekarang kamu bisa pantau uangmu kepake buat apa aja',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Color(0XFF088C15),
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 35),

            // Transaksi berdasarkan tanggal
            for (final date in uniqueDates) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  _getFormattedDate(date),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
              SizedBox(height: 15),
              _buildTransactionListByDate(date),
              SizedBox(height: 35),
            ],
          ],
        );
      }),
    );
  }

  // Daftar transaksi berdasarkan tanggal
  Widget _buildTransactionListByDate(DateTime date) {
    final transactionsByDate = _historyTransactionController.getTransactionsByDate(
      date,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.only(top: 12, bottom: 12, left: 16),
        decoration: BoxDecoration(
          color: Color(0xFFFDFDFD),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            for (int i = 0; i < transactionsByDate.length; i++) ...[
              _buildTransactionItem(transactionsByDate[i]),
              if (i < transactionsByDate.length - 1)
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5, left: 55),
                  child: Divider(color: Color(0xFFEEEFF3), thickness: 1),
                ),
            ],
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan item transaksi
  Widget _buildTransactionItem(transaction) {
    return Row(
      children: [
        Image.asset(transaction.imageAsset, height: 40),
        SizedBox(width: 10),
        Expanded(
          child:
              transaction.secondaryDescription != null
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.description,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: -0.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        transaction.secondaryDescription!,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
                  : Text(
                    transaction.description,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _formatCurrency(transaction.amount),
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color:
                      transaction.amount < 0
                          ? Color(0xFF626E7A)
                          : Color(0xFF088C15),
                  letterSpacing: -0.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    transaction.paymentMethod,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(width: 4),
                  Image.asset('assets/circleicon_gopay.png', height: 14),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(String label, {required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Color(0XFFC0C5C9), width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    final List<String> days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu',
    ];
    final List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    int dayIndex = date.weekday - 1;
    String day = days[dayIndex];
    String month = months[date.month - 1];

    return '$day, ${date.day} $month ${date.year}';
  }

  // Format nominal transaksi
  String _formatCurrency(double amount) {
    if (amount < 0) {
      return '-Rp${(-amount).toInt()}';
    }
    return 'Rp${amount.toInt()}';
  }
}

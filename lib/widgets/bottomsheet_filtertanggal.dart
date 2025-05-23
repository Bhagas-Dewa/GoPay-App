import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/widgets/button_hapus_riwayattransaksi.dart';
import 'package:intl/intl.dart';
import 'package:gopay_task/models/transaction_model.dart';

class BottomsheetFiltertanggal extends StatefulWidget {
  const BottomsheetFiltertanggal({super.key});

  @override
  State<BottomsheetFiltertanggal> createState() =>
      _BottomsheetFiltertanggalState();
}

class _BottomsheetFiltertanggalState extends State<BottomsheetFiltertanggal> {
  int _selectedTanggalIndex = 0;
  late DateTime _startDate;
  late DateTime _endDate;

  // DateTime _startDate = DateTime.now().subtract(const Duration(days: 1));
  // DateTime _endDate = DateTime.now();

  final DateFormat _dateFormat = DateFormat('EEE, dd MMM yyyy', 'id_ID');
  final HistoryTransactionController _historyTransactionController =
      Get.find<HistoryTransactionController>();

  @override
  void initState() {
    super.initState();
    _selectedTanggalIndex = _historyTransactionController.selectedFilterIndex.value;
    _startDate = _historyTransactionController.customStartDate.value;
    _endDate = _historyTransactionController.customEndDate.value;
  }

  // Menggunakan function dari TransactionController untuk memilih tanggal awal
  Future<void> _selectStartDate(BuildContext context) async {
    setState(() {
      _selectedTanggalIndex = 4;
    });

    final DateTime? picked = await _historyTransactionController.selectStartDate(
      context,
      _startDate,
      _endDate,
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
      });
    }
  }

  // Menggunakan function dari TransactionController untuk memilih tanggal akhir
  Future<void> _selectEndDate(BuildContext context) async {
    setState(() {
      _selectedTanggalIndex = 4;
    });

    final DateTime? picked = await _historyTransactionController.selectEndDate(
      context,
      _endDate,
      _startDate,
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  String _getDateRangeText(int days) {
    final DateTime now = DateTime.now();
    final DateTime startDate = now.subtract(Duration(days: days));
    return '${_dateFormat.format(startDate)} - ${_dateFormat.format(now)}';
  }

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
                'Pilih tanggal transaksi',
                style: GoogleFonts.lora(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              ButtonHapusRiwayattransaksi(
                isActive: _selectedTanggalIndex > 0,
                onTap: () {
                  if (_selectedTanggalIndex > 0) {
                    setState(() {
                      _selectedTanggalIndex = 0;
                      _startDate = DateTime.now().subtract(const Duration(days: 1));
                      _endDate = DateTime.now();
                    });
                    _historyTransactionController.resetAllFilters();
                    Get.back();
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '7 hari terakhir',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    _getDateRangeText(7),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              Radio<int>(
                value: 1,
                groupValue: _selectedTanggalIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedTanggalIndex = value!;
                  });
                },
                activeColor: Color(0XFF088C15),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1.5),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '30 hari terakhir',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    _getDateRangeText(30),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              Radio<int>(
                value: 2,
                groupValue: _selectedTanggalIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedTanggalIndex = value!;
                  });
                },
                activeColor: Color(0XFF088C15),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Divider(color: Color(0xFFEEEFF3), thickness: 1.5),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '90 hari terakhir',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    _getDateRangeText(90),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),
                ],
              ),
              Radio<int>(
                value: 3,
                groupValue: _selectedTanggalIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedTanggalIndex = value!;
                  });
                },
                activeColor: Color(0XFF088C15),
              ),
            ],
          ),

          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Atur tanggal',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              Radio<int>(
                value: 4,
                groupValue: _selectedTanggalIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedTanggalIndex = value!;
                  });
                },
                activeColor: Color(0XFF088C15),
              ),
            ],
          ),

          SizedBox(height: 5),
          //container filter range tanggal
          Row(
            children: [
              //filter dari tanggal
              Expanded(
                child: InkWell(
                  onTap: () => _selectStartDate(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEFF3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dari',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        //text berubah sesuai date picker
                        Text(
                          _dateFormat.format(_startDate),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              //filter sampai tanggal
              Expanded(
                child: InkWell(
                  onTap: () => _selectEndDate(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEFF3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sampai',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        //text berubah sesuai date picker
                        Text(
                          _dateFormat.format(_endDate),
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 65), //awal 80
          InkWell(
            onTap: () {
              if (_selectedTanggalIndex == 1) {
                // 7 hari terakhir
                final DateTime now = DateTime.now();
                _historyTransactionController.setFilter(1);
                _historyTransactionController.filterTransactionsByDateRange(
                  now.subtract(const Duration(days: 7)),
                  now,
                );
              } else if (_selectedTanggalIndex == 2) {
                // 30 hari terakhir
                final DateTime now = DateTime.now();
                _historyTransactionController.setFilter(2);
                _historyTransactionController.filterTransactionsByDateRange(
                  now.subtract(const Duration(days: 30)),
                  now,
                );
              } else if (_selectedTanggalIndex == 3) {
                // 90 hari terakhir
                final DateTime now = DateTime.now();
                _historyTransactionController.setFilter(3);
                _historyTransactionController.filterTransactionsByDateRange(
                  now.subtract(const Duration(days: 90)),
                  now,
                );
              } else if (_selectedTanggalIndex == 4) {
                // Tanggal yang dipilih manual
                _historyTransactionController.setFilter(
                  4,
                  startDate: _startDate,
                  endDate: _endDate,
                );
                _historyTransactionController.filterTransactionsByDateRange(
                  _startDate,
                  _endDate,
                );
              } else {
                // Default
                _historyTransactionController.resetTransactionFilter();
              }

              Get.back();
            },
            child: Container(
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

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gopay_task/models/transaction_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class HistoryTransactionController extends GetxController {
  static String TRANSACTIONS_KEY = 'gopay_transactions';
  static String FILTER_STATE_KEY = 'filter_state';
  static String SERVICE_FILTER_KEY = 'service_filter';

  final RxList<TransactionModel> transactions = <TransactionModel>[].obs;
  final RxList<TransactionModel> filteredTransactions =
      <TransactionModel>[].obs;

  // Untuk menyimpan filter tanggal
  Rx<DateTime?> startDateFilter = Rx<DateTime?>(null);
  Rx<DateTime?> endDateFilter = Rx<DateTime?>(null);

  RxSet<TransactionType> selectedServiceTypes = <TransactionType>{}.obs;

  RxInt selectedFilterIndex = 0.obs;
  Rx<DateTime> customStartDate = DateTime.now().subtract(Duration(days: 1)).obs;
  Rx<DateTime> customEndDate = DateTime.now().obs;

  final Uuid _uuid = Uuid();

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
    loadFilterState();
    loadServiceFilter();
    if (transactions.isEmpty) {
      _addDummyTransactions();
    }
    filteredTransactions.value = transactions;
  }

  Future<void> saveFilterState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final filterState = {
        'selectedFilterIndex': selectedFilterIndex.value,
        'customStartDate': customStartDate.value.toIso8601String(),
        'customEndDate': customEndDate.value.toIso8601String(),
        'startDateFilter': startDateFilter.value?.toIso8601String(),
        'endDateFilter': endDateFilter.value?.toIso8601String(),
      };
      await prefs.setString(FILTER_STATE_KEY, jsonEncode(filterState));
    } catch (e) {
      print('Error saving filter state: $e');
    }
  }

  Future<void> saveServiceFilter() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final serviceFilterList =
          selectedServiceTypes.map((type) => type.name).toList();
      await prefs.setStringList(SERVICE_FILTER_KEY, serviceFilterList);
    } catch (e) {
      print('Error saving service filter: $e');
    }
  }

  Future<void> loadFilterState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? filterStateJson = prefs.getString(FILTER_STATE_KEY);

      if (filterStateJson != null) {
        final Map<String, dynamic> filterState = jsonDecode(filterStateJson);

        selectedFilterIndex.value = filterState['selectedFilterIndex'] ?? 0;
        customStartDate.value = DateTime.parse(filterState['customStartDate']);
        customEndDate.value = DateTime.parse(filterState['customEndDate']);

        if (filterState['startDateFilter'] != null) {
          startDateFilter.value = DateTime.parse(
            filterState['startDateFilter'],
          );
        }
        if (filterState['endDateFilter'] != null) {
          endDateFilter.value = DateTime.parse(filterState['endDateFilter']);
        }

        // Terapkan filter jika ada yang aktif
        if (selectedFilterIndex.value > 0) {
          _applyCurrentFilter();
        }
      }
    } catch (e) {
      print('Error loading filter state: $e');
    }
  }

  Future<void> loadServiceFilter() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<String>? serviceFilterList = prefs.getStringList(
        SERVICE_FILTER_KEY,
      );

      if (serviceFilterList != null) {
        selectedServiceTypes.clear();
        for (String typeName in serviceFilterList) {
          try {
            final type = TransactionType.values.byName(typeName);
            selectedServiceTypes.add(type);
          } catch (e) {
            print('Error parsing service type: $typeName');
          }
        }
      }
    } catch (e) {
      print('Error loading service filter: $e');
    }
  }

  void _applyCurrentFilter() {
    if (selectedFilterIndex.value == 1) {
      // 7 hari terakhir
      final DateTime now = DateTime.now();
      filterTransactionsByDateRange(
        now.subtract(Duration(days: 7)),
        now,
        saveState: false,
      );
    } else if (selectedFilterIndex.value == 2) {
      // 30 hari terakhir
      final DateTime now = DateTime.now();
      filterTransactionsByDateRange(
        now.subtract(Duration(days: 30)),
        now,
        saveState: false,
      );
    } else if (selectedFilterIndex.value == 3) {
      // 90 hari terakhir
      final DateTime now = DateTime.now();
      filterTransactionsByDateRange(
        now.subtract(Duration(days: 90)),
        now,
        saveState: false,
      );
    } else if (selectedFilterIndex.value == 4) {
      // Custom date range
      filterTransactionsByDateRange(
        customStartDate.value,
        customEndDate.value,
        saveState: false,
      );
    }
  }

  // Getter untuk mengetahui apakah ada filter yang aktif
  bool get hasActiveFilter =>
      selectedFilterIndex.value > 0 || selectedServiceTypes.isNotEmpty;
  bool get hasActiveServiceFilter => selectedServiceTypes.isNotEmpty;

  void setFilter(int filterIndex, {DateTime? startDate, DateTime? endDate}) {
    selectedFilterIndex.value = filterIndex;

    if (filterIndex == 4 && startDate != null && endDate != null) {
      customStartDate.value = startDate;
      customEndDate.value = endDate;
    }

    saveFilterState();
  }

  // Method untuk toggle service filter
  void toggleServiceFilter(TransactionType serviceType) {
    if (selectedServiceTypes.contains(serviceType)) {
      selectedServiceTypes.remove(serviceType);
    } else {
      selectedServiceTypes.add(serviceType);
    }
    saveServiceFilter();
  }

  // Method untuk apply service filter
  void applyServiceFilter() {
    applyAllFilters();
  }

  // Method untuk reset service filter
  void resetServiceFilter() {
    selectedServiceTypes.clear();
    saveServiceFilter();
    applyAllFilters();
  }

  // Method untuk menerapkan semua filter sekaligus
  void applyAllFilters() {
    List<TransactionModel> result = List.from(transactions);

    // Apply date filter
    if (startDateFilter.value != null && endDateFilter.value != null) {
      result =
          result.where((transaction) {
            return transaction.date.isAfter(
                  startDateFilter.value!.subtract(const Duration(seconds: 1)),
                ) &&
                transaction.date.isBefore(
                  endDateFilter.value!.add(const Duration(seconds: 1)),
                );
          }).toList();
    }

    // Apply service filter
    if (selectedServiceTypes.isNotEmpty) {
      result =
          result.where((transaction) {
            return selectedServiceTypes.contains(transaction.type);
          }).toList();
    }

    filteredTransactions.value = result;
    update();
  }

  // reset semua filter
  void resetAllFilters() {
    selectedFilterIndex.value = 0;
    startDateFilter.value = null;
    endDateFilter.value = null;
    customStartDate.value = DateTime.now().subtract(Duration(days: 1));
    customEndDate.value = DateTime.now();
    selectedServiceTypes.clear();
    filteredTransactions.value = transactions;

    saveFilterState();
    saveServiceFilter();
    update();
  }

  Future<void> loadTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? transactionsJson = prefs.getString(TRANSACTIONS_KEY);

      if (transactionsJson != null) {
        final List<dynamic> decodedList = jsonDecode(transactionsJson);
        final List<TransactionModel> loadedTransactions =
            decodedList.map((item) => TransactionModel.fromJson(item)).toList();

        loadedTransactions.sort((a, b) => b.date.compareTo(a.date));
        transactions.value = loadedTransactions;
        filteredTransactions.value = loadedTransactions;
      }
    } catch (e) {
      print('Error loading transactions: $e');
    }
  }

  Future<void> saveTransactions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedTransactions = jsonEncode(
        transactions.map((transaction) => transaction.toJson()).toList(),
      );
      await prefs.setString(TRANSACTIONS_KEY, encodedTransactions);
    } catch (e) {
      print('Error saving transactions: $e');
    }
  }

  Future<void> addTransaction(
    TransactionType type,
    double amount,
    String description, {
    String? secondaryDescription,
    String? paymentMethod = 'GoPay Saldo',
    DateTime? transactionDate,
  }) async {
    final transaction = TransactionModel(
      id: _uuid.v4(),
      type: type,
      amount: amount,
      date: transactionDate ?? DateTime.now(),
      description: description,
      secondaryDescription: secondaryDescription,
      imageAsset: TransactionModel.getImageAssetByType(type),
      paymentMethod: paymentMethod ?? 'GoPay Saldo',
    );

    transactions.insert(0, transaction);

    if (startDateFilter.value == null && endDateFilter.value == null) {
      filteredTransactions.insert(0, transaction);
    } else {
      if (_isTransactionInDateRange(transaction)) {
        filteredTransactions.insert(0, transaction);
      }
    }

    await saveTransactions();
    update();
  }

  List<TransactionModel> getTransactionsByDate(DateTime date) {
    final List<TransactionModel> result =
        filteredTransactions
            .where(
              (transaction) =>
                  transaction.date.year == date.year &&
                  transaction.date.month == date.month &&
                  transaction.date.day == date.day,
            )
            .toList();

    return result;
  }

  List<DateTime> getUniqueDates() {
    final Set<String> uniqueDates = {};
    final List<DateTime> result = [];

    for (var transaction in filteredTransactions) {
      final String dateKey =
          '${transaction.date.year}-${transaction.date.month}-${transaction.date.day}';
      if (!uniqueDates.contains(dateKey)) {
        uniqueDates.add(dateKey);
        result.add(
          DateTime(
            transaction.date.year,
            transaction.date.month,
            transaction.date.day,
          ),
        );
      }
    }

    result.sort((a, b) => b.compareTo(a));
    return result;
  }

  // Filter transaksi berdasarkan range tanggal
  void filterTransactionsByDateRange(
    DateTime startDate,
    DateTime endDate, {
    bool saveState = true,
  }) {
    final normalizedStartDate = DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
    );
    final normalizedEndDate = DateTime(
      endDate.year,
      endDate.month,
      endDate.day,
      23,
      59,
      59,
    );

    startDateFilter.value = normalizedStartDate;
    endDateFilter.value = normalizedEndDate;

    filteredTransactions.value =
        transactions.where((transaction) {
          return transaction.date.isAfter(
                normalizedStartDate.subtract(Duration(seconds: 1)),
              ) &&
              transaction.date.isBefore(
                normalizedEndDate.add(Duration(seconds: 1)),
              );
        }).toList();

    if (saveState) {
      saveFilterState();
    }
    update();
  }

  void resetTransactionFilter() {
    resetAllFilters();
  }

  bool _isTransactionInDateRange(TransactionModel transaction) {
    if (startDateFilter.value == null || endDateFilter.value == null) {
      return true;
    }

    return transaction.date.isAfter(
          startDateFilter.value!.subtract(Duration(seconds: 1)),
        ) &&
        transaction.date.isBefore(
          endDateFilter.value!.add(Duration(seconds: 1)),
        );
  }

  // Menampilkan date picker untuk tanggal awal
  Future<DateTime?> selectStartDate(
    BuildContext context,
    DateTime initialDate,
    DateTime endDate,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: endDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF088C15),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    return picked;
  }

  // Menampilkan date picker untuk tanggal akhir
  Future<DateTime?> selectEndDate(
    BuildContext context,
    DateTime initialDate,
    DateTime startDate,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: startDate,
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color(0xFF088C15),
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    return picked;
  }

  // Data Dummy
  void _addDummyTransactions() {
    //Data untuk Rabu, 21 Mei 2025
    final may21 = DateTime(2025, 5, 21);
    addTransaction(
      TransactionType.gopayTopup,
      20000,
      'Gopay Top Up',
      transactionDate: may21.add(Duration(hours: 1)),
    );
    addTransaction(
      TransactionType.goRide,
      -20000,
      'Tunjungan Plaza 5, Surabaya',
      transactionDate: may21.add(Duration(hours: 1)),
    );

    // Data untuk Senin, 12 Mei 2025
    final may12 = DateTime(2025, 5, 12);
    addTransaction(
      TransactionType.localService,
      -17000,
      'Tiktok Local Service',
      transactionDate: may12.add(Duration(hours: 15)),
    );

    addTransaction(
      TransactionType.gopayTopup,
      20000,
      'GoPay Top Up',
      transactionDate: may12.add(Duration(hours: 14)),
    );

    addTransaction(
      TransactionType.bayarOnlineShop,
      -89922,
      'Bayar ke Tokopedia',
      transactionDate: may12.add(Duration(hours: 12)),
    );

    addTransaction(
      TransactionType.gopayTopup,
      90000,
      'GoPay Top Up',
      transactionDate: may12.add(Duration(hours: 11)),
    );

    // Data untuk Senin, 5 Mei 2025
    final may5 = DateTime(2025, 5, 5);
    addTransaction(
      TransactionType.goPulsa,
      -19900,
      'GoPulsa SIMPATI 25.000 - 081217936746 #843859293-248833645',
      transactionDate: may5.add(Duration(hours: 13)),
    );

    addTransaction(
      TransactionType.gopayTopup,
      20000,
      'GoPay Top Up',
      transactionDate: may5.add(Duration(hours: 12)),
    );

    // Data untuk Sabtu, 12 April 2025
    final apr12 = DateTime(2025, 4, 12);
    addTransaction(
      TransactionType.goRide,
      -15000,
      'Jalan Ir. H. Soekarno Hatta No. 1, Jakarta',
      transactionDate: apr12.add(Duration(hours: 10)),
    );

    addTransaction(
      TransactionType.gopayTopup,
      15000,
      'GoPay Top Up',
      transactionDate: apr12.add(Duration(hours: 9)),
    );

    // Data untuk Rabu, 26 Maret 2025
    final mar26 = DateTime(2025, 3, 26);
    addTransaction(
      TransactionType.transferKeluar,
      -50000,
      'Ditransder ke Bhagas Satrya Dewa',
      secondaryDescription: 'BLU By BCA Digital 0068854678900',
      transactionDate: mar26.add(Duration(hours: 14)),
    );

    // Data untuk Minggu, 19 Januari 2025
    final jan19 = DateTime(2025, 1, 19);
    addTransaction(
      TransactionType.goFood,
      -30000,
      'BURGER GEBER by Janji Jiwa, Merr',
      secondaryDescription: 'Kopi Janji Jiwa & Jiwa Toast, Merr',
      transactionDate: jan19.add(Duration(hours: 18)),
    );

    addTransaction(
      TransactionType.gopayTopup,
      35000,
      'GoPay Top Up',
      transactionDate: jan19.add(Duration(hours: 17)),
    );
  }
}

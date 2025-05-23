import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BalancecardController extends GetxController with GetSingleTickerProviderStateMixin {
  final Rxn<String> selectedNominal = Rxn<String>();
  late TabController tabController;
  RxBool isScrolled = false.obs;
  final RxInt currentTab = 0.obs;

  final Map<String, String> nominalDisplayMap = {
    'Rp50rb': 'Rp50.000',
    'Rp100rb': 'Rp100.000',
    'Rp150rb': 'Rp150.000',
    'Rp200rb': 'Rp200.000',
    'Rp250rb': 'Rp250.000',
    'Rp300rb': 'Rp300.000',
    'Rp500rb': 'Rp500.000',
    'Rp750rb': 'Rp750.000',
    'Rp1jt': 'Rp1.000.000',
    'Rp1.2jt': 'Rp1.200.000',
  };

  final Map<String, String> nominalWithAdminMap = {
    'Rp50rb': 'Rp55.000',
    'Rp100rb': 'Rp105.000',
    'Rp150rb': 'Rp155.000',
    'Rp200rb': 'Rp205.000',
    'Rp250rb': 'Rp255.000',
    'Rp300rb': 'Rp305.000',
    'Rp500rb': 'Rp505.000',
    'Rp750rb': 'Rp755.000',
    'Rp1jt': 'Rp1.005.000',
    'Rp1.2jt': 'Rp1.205.000',
  };

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    
    // Listen to tab changes
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        currentTab.value = tabController.index;
      }
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void setSelectedNominal(String nominal) {
    selectedNominal.value = nominal;
  }

  String getNominalDisplay() {
    return selectedNominal.value == null ? 'Pilih nominal' : nominalDisplayMap[selectedNominal.value!] ?? '';
  }

  String getNominalWithAdmin() {
    return selectedNominal.value == null ? '' : nominalWithAdminMap[selectedNominal.value!] ?? '';
  }

  bool isNominalSelected(String nominal) {
    return selectedNominal.value == nominal;
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    
    Get.snackbar(
      'Berhasil Disalin',
      '$text telah disalin ke clipboard',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color(0xFF088C15).withOpacity(0.8),
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      duration: Duration(seconds: 2),
      borderRadius: 10,
    );
  }

  // Method to change tab
  void changeTab(int index) {
    currentTab.value = index;
    tabController.animateTo(index);
  }
}
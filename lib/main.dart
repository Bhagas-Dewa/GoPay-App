import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/auth_controller.dart';
import 'package:gopay_task/controllers/balancecard_controller.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/controllers/home_controller.dart';
import 'package:gopay_task/controllers/kirimterima_controller.dart';
import 'package:gopay_task/controllers/numpad_controller.dart';
import 'package:gopay_task/controllers/promo_controller.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';
import 'package:gopay_task/services/auth_service.dart';
import 'package:gopay_task/services/storage_service.dart'; 
import 'package:gopay_task/views/onboarding.dart';
import 'package:intl/date_symbol_data_local.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await initializeDateFormatting('id_ID', null);
  
  // Initialize GetX controllers
  Get.put(StorageService());
  Get.put(AuthService());
  Get.put(AuthController());
  Get.put(HomeController());
  Get.put(HistoryTransactionController()); 
  Get.put(GopaySaldoController(), permanent: true);
  Get.put(KirimTerimaController());
  Get.put(PromoController());
  Get.put(BalancecardController());
  Get.put(TransactionController()); 
  Get.put(NumpadController());
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Color(0xFFEEEFF3),
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  
  runApp(MainApp());
  }



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.interTextTheme()),
      home: OnboardingSplash(),
    );
  }
}
import 'package:get/get.dart';

enum TransactionType {
  localService,        // Ke rekan usaha
  bayarTeman,         // Bayar ke teman
  gopayTopup,         // Top Up
  transferKeluar,     // Transfer
  goTagihan,          // GoTagihan
  goFood,             // GoFood
  goShop,             // GoShop
  goMart,             // GoMart
  goRide,             // GoRide
  goCar,              // GoCar
  goBluebird,         // GoBluebird
  goTransit,          // GoTransit
  goSend,             // GoSend
  goBox,              // GoBox
  goTix,              // GoTix
  bayarOnlineShop,    // Tokopedia
  parking,            // Parking
  splitBill,          // Split Bill
  makanBergizi,       // Makan Bergizi Gratis
  goPulsa,            // GoPulsa
}

class TransactionModel {
  final String id; 
  final TransactionType type; 
  final double amount;
  final DateTime date; 
  final String description; 
  final String? secondaryDescription; 
  final String imageAsset;
  final String paymentMethod; 

  TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.description,
    this.secondaryDescription,
    required this.imageAsset,
    required this.paymentMethod,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      type: TransactionType.values.byName(json['type']),
      amount: json['amount'],
      date: DateTime.parse(json['date']),
      description: json['description'],
      secondaryDescription: json['secondaryDescription'],
      imageAsset: json['imageAsset'],
      paymentMethod: json['paymentMethod'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'secondaryDescription': secondaryDescription,
      'imageAsset': imageAsset,
      'paymentMethod': paymentMethod,
    };
  }

  static String getImageAssetByType(TransactionType type) {
    switch (type) {
      case TransactionType.localService:
        return 'assets/jenisriwayat_localservice.png';
      case TransactionType.bayarTeman:
        return 'assets/jenisriwayat_trfteman.png';
      case TransactionType.gopayTopup:
        return 'assets/jenisriwayat_topup.png';
      case TransactionType.transferKeluar:
        return 'assets/jenisriwayat_trfkeluar.png';
      case TransactionType.goTagihan:
        return 'assets/jenisriwayat_splitbill.png';
      case TransactionType.goFood:
        return 'assets/jenisriwayat_gofood3.png';
      case TransactionType.goShop:
        return 'assets/jenisriwayat_goshop.png';
      case TransactionType.goMart:
        return 'assets/jenisriwayat_gomart.png';
      case TransactionType.goRide:
        return 'assets/jenisriwayat_goride2.png';
      case TransactionType.goCar:
        return 'assets/jenisriwayat_gocar.png';
      case TransactionType.goBluebird:
        return 'assets/jenisriwayat_bluebird.png';
      case TransactionType.goTransit:
        return 'assets/jenisriwayat_transit.png';
      case TransactionType.goSend:
        return 'assets/jenisriwayat_gosend2.png';
      case TransactionType.goBox:
        return 'assets/jenisriwayat_gobox.png';
      case TransactionType.goTix:
        return 'assets/jenisriwayat_gotix.png';
      case TransactionType.bayarOnlineShop:
        return 'assets/jenisriwayat_tokped.png';
      case TransactionType.parking:
        return 'assets/jenisriwayat_parking.png';
      case TransactionType.splitBill:
        return 'assets/jenisriwayat_splitbill.png';
      case TransactionType.makanBergizi:
        return 'assets/jenisriwayat_makanan.png';
      case TransactionType.goPulsa:
        return 'assets/jenisriwayat_pulsa.png';
    }
  }

  // Helper method untuk mendapatkan nama layanan yang readable
  static String getServiceNameByType(TransactionType type) {
    switch (type) {
      case TransactionType.localService:
        return 'Ke rekan usaha';
      case TransactionType.bayarTeman:
        return 'Bayar ke teman';
      case TransactionType.gopayTopup:
        return 'Top Up';
      case TransactionType.transferKeluar:
        return 'Transfer';
      case TransactionType.goTagihan:
        return 'GoTagihan';
      case TransactionType.goFood:
        return 'GoFood';
      case TransactionType.goShop:
        return 'GoShop';
      case TransactionType.goMart:
        return 'GoMart';
      case TransactionType.goRide:
        return 'GoRide';
      case TransactionType.goCar:
        return 'GoCar';
      case TransactionType.goBluebird:
        return 'GoBluebird';
      case TransactionType.goTransit:
        return 'GoTransit';
      case TransactionType.goSend:
        return 'GoSend';
      case TransactionType.goBox:
        return 'GoBox';
      case TransactionType.goTix:
        return 'GoTix';
      case TransactionType.bayarOnlineShop:
        return 'Tokopedia';
      case TransactionType.parking:
        return 'Parking';
      case TransactionType.splitBill:
        return 'Split Bill';
      case TransactionType.makanBergizi:
        return 'Makan Bergizi Gratis';
      case TransactionType.goPulsa:
        return 'GoPulsa';
    }
  }

  String getFormattedDate() {
    final List<String> days = [
      'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
    ];
    final List<String> months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];

    int dayIndex = date.weekday - 1;
    String day = days[dayIndex];
    String month = months[date.month - 1];
    
    return '$day, ${date.day} $month ${date.year}';
  }
}
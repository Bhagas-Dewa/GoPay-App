import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_bank.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_tunai.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/bottomsheet_akunbank.dart';
import 'package:gopay_task/widgets/button_ceklain.dart';
import 'package:dotted_line/dotted_line.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  // Data untuk baris bank pertama
  final List<BankItemData> firstRowBanks = [
    BankItemData(imagePath: 'assets/logo_kartukredit.png', name: 'Debit Card'),
    BankItemData(imagePath: 'assets/logo_oneklik.png', name: 'BCA OneKlik'),
    BankItemData(
      imagePath: 'assets/logo_bankjago.png',
      name: 'Jago Pockets',
      showFreeLabel: true,
    ),
    BankItemData(imagePath: 'assets/logo_bri.png', name: 'BRI Direct Debit'),
  ];

  // Data untuk baris bank kedua
  final List<BankItemData> secondRowBanks = [
    BankItemData(imagePath: 'assets/logofill_alfamart.png', name: 'Alfamart'),
    BankItemData(imagePath: 'assets/logofill_indomart.png', name: 'Indomart'),
    BankItemData(imagePath: 'assets/logo_lawson.png', name: 'Lawson'),
    BankItemData(
      imagePath: 'assets/logo_mitratokped.png',
      name: 'Mitra Tokopedia',
    ),
  ];

  // Data untuk baris bank ketiga
  final List<BankItemData> thirdRowBanks = [
    BankItemData(imagePath: 'assets/logo_atmbersama.png', name: 'ATM Bersama'),
    BankItemData(imagePath: 'assets/logo_alfamidi.png', name: 'Alfamidi'),
    BankItemData(imagePath: 'assets/logo_dandan.png', name: 'Dan+Dan'),
    BankItemData(imagePath: 'assets/logo_posindo.png', name: 'Pos Indonesia'),
  ];

  // Data untuk baris bank keempat
  final List<BankItemData> fourthRowBanks = [
    BankItemData(
      imagePath: 'assets/logo_bri.png',
      name: 'BRI',
      showFreeLabel: true,
    ),
    BankItemData(
      imagePath: 'assets/logo_bca.png',
      name: 'BCA',
      showFreeLabel: true,
    ),
    BankItemData(
      imagePath: 'assets/logo_mandiri.png',
      name: 'Mandiri',
      showFreeLabel: true,
    ),
    BankItemData(
      imagePath: 'assets/logo_bni.png',
      name: 'BNI',
      showFreeLabel: true,
    ),
  ];

  // Data untuk baris bank kelima
  final List<BankItemData> fifthRowBanks = [
    BankItemData(
      imagePath: 'assets/logo_bankjago.png',
      name: 'Jago',
      showFreeLabel: true,
    ),
    BankItemData(
      imagePath: 'assets/logo_permatabank.png',
      name: 'PermataBank',
      showFreeLabel: true,
    ),
    BankItemData(imagePath: 'assets/logo_cimbniaga.png', name: 'CIMB Niaga'),
    BankItemData(imagePath: 'assets/logo_atmbersama.png', name: 'ATM Bersama'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Top up'),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambah akun bank',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'Hubungkan kartu debitmu dan top up dari app GoPay',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 15),

                // Baris bank pertama
                buildBankRow(context, firstRowBanks),

                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    dashLength: 4,
                    dashColor: Color(0xFFEEEFF3),
                    lineThickness: 1,
                    dashGapLength: 3,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleBank(
                      imagePaths: [
                        'assets/circleicon_blu.png',
                        'assets/circleicon_bankbangkok.png',
                        'assets/circleicon_mandiri.png',
                      ],
                    ),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return FractionallySizedBox(
                              heightFactor: 0.94,
                              child: BottomsheetAkunbank(),
                            );
                          },
                        );
                      },
                      child: ButtonCekLain(text: 'Cek 8 metode lain'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pakai uang tunai',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'Di minimarket, warung atau agen terdekat',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),

                SizedBox(height: 15),
                buildBankRow(context, secondRowBanks),
                SizedBox(height: 15),
                buildBankRow(context, thirdRowBanks),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    dashLength: 4,
                    dashColor: Color(0xFFEEEFF3),
                    lineThickness: 1,
                    dashGapLength: 3,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleBank(
                      imagePaths: [
                        'assets/circleicon_pegadaian.png',
                        'assets/circleicon_bankdiy.png',
                        'assets/circleicon_bkbukopin.png',
                      ],
                    ),

                    ButtonCekLain(
                      text: 'Cek 7 metode lain',
                      onTap: () {
                        Get.to(() => TopupTunai());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0XFFFDFDFD),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lewat bank',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  'Dari ATM, m-banking, internet banking, dan lain-lain',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),

                SizedBox(height: 15),
                buildBankRow(context, fourthRowBanks),
                SizedBox(height: 20),
                buildBankRow(context, fifthRowBanks),
                SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: DottedLine(
                    direction: Axis.horizontal,
                    dashLength: 4,
                    dashColor: Color(0xFFEEEFF3),
                    lineThickness: 1,
                    dashGapLength: 3,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCircleBank(
                      imagePaths: [
                        'assets/circleicon_prima.png',
                        'assets/circleicon_alto.png',
                        'assets/circleicon_bsi.png',
                      ],
                    ),

                    ButtonCekLain(
                      text: 'Cek 32 metode lain',
                       onTap: () {
                        Get.to(() => TopupBank());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildBankItem(
  BuildContext context,
  String imagePath,
  String title, {
  bool showFreeLabel = false,
}) {
  // Menghitung lebar item (untuk 4 item dalam satu baris)
  // Nilai 70 berasal dari: 2*20 (padding horizontal ListView) + 2*20 (padding horizontal Container) + 3*10 (jarak antar 4 item)
  final itemWidth = (MediaQuery.of(context).size.width - 80) / 4;

  return Container(
    width: itemWidth,
    child: Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: Color(0XFFF9FAFC),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Color(0xFFEDEDED), width: 1),
              ),
              child: Center(
                child: Image.asset(
                  imagePath,
                  height: 35,
                  width: 35,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (showFreeLabel)
              Positioned(
                left: 0,
                right: 0,
                bottom: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFF4FEF5),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Color(0XFF3DC66C).withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    'Gratis',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF088C15),
                      letterSpacing: -0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 7),
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Color(0xFF626E7A),
            letterSpacing: -0.3,
          ),
          textAlign: TextAlign.center,
          maxLines: title.length > 12 ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget buildBankRow(BuildContext context, List<BankItemData> bankItems) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children:
        bankItems
            .map(
              (item) => buildBankItem(
                context,
                item.imagePath,
                item.name,
                showFreeLabel: item.showFreeLabel,
              ),
            )
            .toList(),
  );
}

Widget buildCircleBank({
  required List<String> imagePaths,
  double width = 80,
  double height = 32,
  double radius = 16,
  double spacing = 25,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: Stack(
      alignment: Alignment.centerLeft,
      clipBehavior: Clip.none,
      children: List.generate(
        imagePaths.length,
        (index) => Positioned(
          left: index * spacing,
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePaths[index]),
            radius: radius,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFEDEDED), width: 1),
                borderRadius: BorderRadius.circular(radius * 2.8),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/models/bank_item_model.dart';
import 'package:gopay_task/views/home/balance_card/tariktunai/tariktunai_bank.dart';
import 'package:gopay_task/views/home/balance_card/tariktunai/tariktunai_transaksi.dart';
import 'package:gopay_task/views/home/balance_card/topup/topup_bank.dart';
import 'package:gopay_task/widgets/appbar_primary.dart';
import 'package:gopay_task/widgets/button_ceklain.dart';
import 'package:gopay_task/widgets/wavy_clipper.dart';

class TariktunaiPage extends StatefulWidget {
  const TariktunaiPage({super.key});

  @override
  State<TariktunaiPage> createState() => _TariktunaiPageState();
}

class _TariktunaiPageState extends State<TariktunaiPage> {
  // Data untuk baris bank keempat
  final List<BankItemData> firstRowBanks = [
    BankItemData(imagePath: 'assets/logo_bri.png', name: 'BRI'),
    BankItemData(imagePath: 'assets/logo_bca.png', name: 'BCA'),
    BankItemData(imagePath: 'assets/logo_mandiri.png', name: 'Mandiri'),
    BankItemData(imagePath: 'assets/logo_bni.png', name: 'BNI'),
  ];

  // Data untuk baris bank kelima
  final List<BankItemData> secondRowBanks = [
    BankItemData(imagePath: 'assets/logo_bankjago.png', name: 'Jago'),
    BankItemData(imagePath: 'assets/logo_permatabank.png', name: 'PermataBank'),
    BankItemData(imagePath: 'assets/logo_cimbniaga.png', name: 'CIMB Niaga'),
    BankItemData(imagePath: 'assets/logo_atmbersama.png', name: 'ATM Bersama'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarPrimary(title: 'Tarik tunai'),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0XFF4425FF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: -0.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Langkah 1: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: 'Transfer ke rekeningmu, gratis!',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 5),

                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white,
                            letterSpacing: -0.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Langkah 2: ',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            TextSpan(
                              text: 'Tarik tunai dari ATM bank',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 67,
                  child: Image.asset(
                    'assets/label_gratisdiatm.png',
                    height: 25,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0XFFFDFDFD),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lewat transfer bank',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: -0.3,
                    ),
                  ),
                  Text(
                    'Gratis transfer ke rek. bank lalu tarik tunai di ATM',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF626E7A),
                      letterSpacing: -0.3,
                    ),
                  ),

                  SizedBox(height: 20),
                  buildBankRow(context, firstRowBanks),
                  SizedBox(height: 20),
                  buildBankRow(context, secondRowBanks),
                  SizedBox(height: 20),

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
                        text: 'Cek 127 metode lain',
                        onTap: () {
                          Get.to(() => TariktunaiBank());
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Langsung di ATM & minimarket',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Praktis, tinggal pilih nominal di aplikasi',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF626E7A),
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(() => TariktunaiTransaksi());
              },
              child: Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 16,
                  bottom: 8,
                ),
                height: 72,
                decoration: BoxDecoration(
                  color: Color(0XFFFDFDFD),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/circletopup_bca.png', height: 40),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BCA ATM',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            letterSpacing: -0.3,
                          ),
                        ),
                        Text(
                          'Biaya admin Rp5.000',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(height: 10),
                        Icon(Icons.arrow_forward_ios_rounded, size: 18),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Container(
            height: 2,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: Container(color: const Color(0xFFEEEFF3)),
                ),

                // Kurva putih dengan clipper
                Positioned(
                  top: -15,
                  left: 20,
                  right: 20,
                  height: 35,
                  child: ClipPath(
                    clipper: WaveClipper(),
                    child: Container(color: Colors.white),
                  ),
                ),

                // Border pada kurva
                Positioned(
                  top: -15,
                  left: 0,
                  right: 0,
                  height: 33,
                  child: CustomPaint(
                    painter: WavePainter(
                      dottedLineOffset: 8.0,
                      drawShadow: true,
                    ),
                    size: Size(MediaQuery.of(context).size.width, 40),
                  ),
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

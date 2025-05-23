import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/toggle_controller.dart';
import 'package:gopay_task/widgets/button_lihatlainnya.dart';
import 'package:gopay_task/widgets/toggle_swtich.dart';

class SumberdanaCoins extends StatefulWidget {
  SumberdanaCoins({super.key});
  final ToggleController controller = Get.put(ToggleController());

  @override
  State<SumberdanaCoins> createState() => _SumberdanaCoinsState();
}

class _SumberdanaCoinsState extends State<SumberdanaCoins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 255,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0XFF203852),
                        Color(0XFF185272),
                        Color(0XFF106C93),
                      ],
                      stops: [0.1, 0.45, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 150),
                  child: _buildGopayCoins(ToggleController()),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 445, bottom: 80),
                  child: _buildTentangGopayCoins(),
                ),

              ],
            ),
          ),

          Positioned(
            top: 32,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_rounded, size: 24),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.help_rounded, size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayCoins(ToggleController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFDFDFD),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/circleicon_coins.png', height: 22),
                      SizedBox(width: 10),
                      Text(
                        'GoPay Coins',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '0',
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      color: Colors.black,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/icon_shuffle.png', height: 14),
                      SizedBox(width: 16),
                      Text(
                        'Setara dengan Rp0',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Color(0xFF626E7A),
                          letterSpacing: -0.3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset('assets/dot_corner.png', height: 60),
            ],
          ),

          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: DottedLine(
              direction: Axis.horizontal,
              dashLength: 4,
              dashColor: Color(0xFF626E7A).withOpacity(0.5),
              lineThickness: 1,
              dashGapLength: 5,
            ),
          ),

          Row(
            children: [
              Icon(
                Icons.replay_circle_filled_rounded,
                color: Color(0XFF414B54),
                size: 26,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Otomatis pakai GoPay Coins',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),

                    Text(
                      'Buat transaksi kamu, secara utuh/parsial.',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
              Obx(
                () => ToggleSwitch(
                  value: controller.isToggled.value,
                  onChanged: (value) {
                    controller.setToggle(value);
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 25),

          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFEEEFF3).withOpacity(0.3)],
                stops: [0.1, 1.0],
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xFFEEEFF3), width: 0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lebih lanjut soal pengaturan ini',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                  color: Color(0XFF0A7F16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTentangGopayCoins() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFDFDFD),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sekilas tentang GoPay coins',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.keyboard_arrow_up_rounded, size: 24),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_dompet.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Kamu bisa pakai GoPay Coins sebagai metode bayar buat hemat pengerluaran.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_moneyup.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Kamu bisa pakai GoPay Coins buat transaksi di Gojek, Tokopedia, dan rekan usaha tertentu.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_moneyup.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Kalau kamu milih buat pakai GoPay Coins, Coins-mu bakal selalu digunakan lebih dahulu. Kalau gak cukup, kamu bisa gabungin dengan metode lain.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_shuffle.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '1 GoPay Coins setara dengan Rp1.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_moneydown.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'GoPay Coins tidak bisa diuangkan & ditransfer ke pengguna lain.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

           SizedBox(height: 15),

          Row(
            children: [
              Image.asset('assets/ttgcoins_time.png', height: 38),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'GoPay Coins akan hangus pada 31 Desember pada tahun selanjutnya sejak kamu terima.',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xFF626E7A),
                    letterSpacing: -0.3,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 25),

          Container(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Color(0xFFEEEFF3).withOpacity(0.3)],
                stops: [0.1, 1.0],
              ),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xFFEEEFF3), width: 0.8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Info lebih lanjut seputar GoPay Coins',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.3,
                  ),
                ),
                Icon(
                  Icons.help_rounded,
                  size: 20,
                  color: Color(0XFF0A7F16),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

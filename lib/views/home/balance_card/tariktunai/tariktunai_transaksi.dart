import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/controllers/balancecard_controller.dart';
import 'package:gopay_task/widgets/appbar_secondary.dart';
import 'package:gopay_task/widgets/bottomcurve_clipper.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:gopay_task/widgets/bottomsheet_tariktunai_sumberdana.dart';
import 'package:gopay_task/widgets/bottomsheet_tariktunai_transaksi.dart';

class TariktunaiTransaksi extends StatefulWidget {
  const TariktunaiTransaksi({super.key});

  @override
  State<TariktunaiTransaksi> createState() => _TariktunaiTransaksiState();
}

class _TariktunaiTransaksiState extends State<TariktunaiTransaksi> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BalancecardController>();

    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      appBar: AppbarSecondary(
        title: 'Tarik tunai',
        rightIcon: Icon(Icons.help_rounded, size: 24, color: Colors.black),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 12),
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return FractionallySizedBox(
                      heightFactor: 0.94,
                      child: const BottomsheetTariktunaiBank(),
                    );
                  },
                );
              },
              child: _buildATMUpper(),
            ),
          ),
          SizedBox(height: 10),
          _buildPilihNomial(controller),
        ],
      ),
      bottomNavigationBar: Obx(
        () =>
            controller.selectedNominal.value != null
                ? _buildTarikTunaiConfirmation(controller)
                : SizedBox.shrink(),
      ),
    );
  }

  Widget _buildATMUpper() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
            height: 100,
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/circletopup_bca.png', height: 40),
                SizedBox(width: 10),
                Text(
                  'BCA ATM',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0XFFFDFDFD),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: CustomPaint(painter: BottomCurveBorderPainter()),
        ),
      ],
    );
  }

  Widget _buildPilihNomial(BalancecardController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0XFFFDFDFD),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 70,
              decoration: inset.BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFE5E6E8), Color(0xFFEEEFF3)],
                  stops: [0.3, 0.9],
                ),
                boxShadow: [
                  inset.BoxShadow(
                    inset: true,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Color(0xFFC0C5C9).withOpacity(0.4),
                  ),
                ],
              ),
              //text nominal sesuai button nominal
              child: Center(
                child: Obx(
                  () => Text(
                    controller.getNominalDisplay(),
                    style: GoogleFonts.lora(
                      color:
                          controller.selectedNominal.value == null
                              ? Colors.grey
                              : Colors.black,
                      fontSize: 20,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            //row nominal 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNominalButton('Rp50rb', controller),
                _buildNominalButton('Rp100rb', controller),
                _buildNominalButton('Rp150rb', controller),
              ],
            ),
            SizedBox(height: 15),
            //row nominal 2
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNominalButton('Rp200rb', controller),
                _buildNominalButton('Rp250rb', controller),
                _buildNominalButton('Rp300rb', controller),
              ],
            ),
            SizedBox(height: 15),
            //row nominal 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildNominalButton('Rp500rb', controller),
                _buildNominalButton('Rp750rb', controller),
                _buildNominalButton('Rp1jt', controller),
              ],
            ),
            SizedBox(height: 15),
            //container full
            InkWell(
              onTap: () => controller.setSelectedNominal('Rp1.2jt'),
              child: Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color:
                          controller.isNominalSelected('Rp1.2jt')
                              ? Color(0XFF0A7F16)
                              : Color(0xFFEDEDED),
                      width: 1,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:
                          controller.isNominalSelected('Rp1.2jt')
                              ? [Color(0XFFFDFDFD), Color(0xFFEEFFED)]
                              : [Color(0XFFFDFDFD), Color(0XFFF6F7F9)],
                      stops:
                          controller.isNominalSelected('Rp1.2jt')
                              ? [0.1, 0.4]
                              : [0.4, 0.9],
                    ),
                  ),
                  child: Text(
                    'Rp1.2jt',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color:
                          controller.isNominalSelected('Rp1.2jt')
                              ? Color(0XFF0A7F16)
                              : Color(0xFF626E7A),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNominalButton(String text, BalancecardController controller) {
    return Expanded(
      child: InkWell(
        onTap: () => controller.setSelectedNominal(text),
        child: Obx(() {
          final bool isSelected = controller.isNominalSelected(text);

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: isSelected ? Color(0XFF0A7F16) : Color(0xFFEDEDED),
                width: 1,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:
                    isSelected
                        ? [Color(0XFFF4FEF5), Color(0xFFEEFFED)]
                        : [Color(0XFFFDFDFD), Color(0XFFF6F7F9)],
                stops: isSelected ? [0.1, 0.8] : [0.4, 0.9],
              ),
            ),
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: isSelected ? Color(0XFF0A7F16) : Color(0xFF626E7A),
                letterSpacing: -0.3,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTarikTunaiConfirmation(BalancecardController controller) {
    return Container(
      height: 190,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0XFFFDFDFD),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 4,
            width: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: const Color(0xFFC0C5C9),
            ),
          ),
          SizedBox(height: 25),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.94,
                    child: BottomsheetTariktunaiSumberdana(),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xFFEDEDED), width: 1),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0XFFFDFDFD), Color(0XFFF6F7F9)],
                  stops: [0.7, 0.9],
                ),
              ),
              child: Row(
                children: [
                  Image.asset('assets/icon_dot3hijau.png', height: 14),
                  SizedBox(width: 8),
                  Text(
                    'Pilih sumber dana',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Color(0XFF0A7F16),
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0XFFFDFDFD),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      size: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Color(0XFF0A7F16),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Konfirmasi & tarik',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      'Biaya admin Rp5.000',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                //text sesuai nominal button + 5000
                Obx(
                  () => Text(
                    controller.getNominalWithAdmin(),
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Image.asset('assets/icon_paperplane.png', height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

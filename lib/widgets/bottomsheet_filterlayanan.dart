import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:gopay_task/widgets/button_hapus_riwayattransaksi.dart';
import 'package:gopay_task/controllers/historytransaction_controller.dart';
import 'package:gopay_task/models/transaction_model.dart';

class BottomsheetFilterlayanan extends StatefulWidget {
  BottomsheetFilterlayanan({super.key});

  @override
  State<BottomsheetFilterlayanan> createState() =>
      _BottomsheetFilterlayananState();
}

class _BottomsheetFilterlayananState extends State<BottomsheetFilterlayanan> {
  final HistoryTransactionController controller = Get.find<HistoryTransactionController>();

  final List<Map<String, Object>> services = [
    {
      'icon': 'assets/jenisriwayat_localservice.png',
      'name': 'Ke rekan usaha',
      'type': TransactionType.localService,
    },
    {
      'icon': 'assets/jenisriwayat_trfteman.png',
      'name': 'Bayar ke teman',
      'type': TransactionType.bayarTeman,
    },
    {
      'icon': 'assets/jenisriwayat_topup.png',
      'name': 'Top Up',
      'type': TransactionType.gopayTopup,
    },
    {
      'icon': 'assets/jenisriwayat_trfkeluar.png',
      'name': 'Transfer',
      'type': TransactionType.transferKeluar,
    },
    {
      'icon': 'assets/jenisriwayat_splitbill.png',
      'name': 'GoTagihan',
      'type': TransactionType.goTagihan,
    },
    {
      'icon': 'assets/jenisriwayat_gofood3.png',
      'name': 'GoFood',
      'type': TransactionType.goFood,
    },
    {
      'icon': 'assets/jenisriwayat_goshop.png',
      'name': 'GoShop',
      'type': TransactionType.goShop,
    },
    {
      'icon': 'assets/jenisriwayat_gomart.png',
      'name': 'GoMart',
      'type': TransactionType.goMart,
    },
    {
      'icon': 'assets/jenisriwayat_goride2.png',
      'name': 'GoRide',
      'type': TransactionType.goRide,
    },
    {
      'icon': 'assets/jenisriwayat_gocar.png',
      'name': 'GoCar',
      'type': TransactionType.goCar,
    },
    {
      'icon': 'assets/jenisriwayat_bluebird.png',
      'name': 'GoBluebird',
      'type': TransactionType.goBluebird,
    },
    {
      'icon': 'assets/jenisriwayat_transit.png',
      'name': 'GoTransit',
      'type': TransactionType.goTransit,
    },
    {
      'icon': 'assets/jenisriwayat_gosend2.png',
      'name': 'GoSend',
      'type': TransactionType.goSend,
    },
    {
      'icon': 'assets/jenisriwayat_gobox.png',
      'name': 'GoBox',
      'type': TransactionType.goBox,
    },
    {
      'icon': 'assets/jenisriwayat_gotix.png',
      'name': 'GoTix',
      'type': TransactionType.goTix,
    },
    {
      'icon': 'assets/jenisriwayat_tokped.png',
      'name': 'Tokopedia',
      'type': TransactionType.bayarOnlineShop,
    },
    {
      'icon': 'assets/jenisriwayat_parking.png',
      'name': 'Parking',
      'type': TransactionType.parking,
    },
    {
      'icon': 'assets/jenisriwayat_splitbill.png',
      'name': 'Split Bill',
      'type': TransactionType.splitBill,
    },
    {
      'icon': 'assets/jenisriwayat_makanan.png',
      'name': 'Makan Bergizi Gratis',
      'type': TransactionType.makanBergizi,
    },
    {
      'icon': 'assets/jenisriwayat_pulsa.png',
      'name': 'GoPulsa',
      'type': TransactionType.goPulsa,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Color(0xFFFDFDFD),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: const Color(0xFFC0C5C9),
              ),
            ),
          ),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filter tipe Layanan',
                style: GoogleFonts.lora(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  letterSpacing: -0.3,
                ),
              ),
              Obx(() {
                final hasSelection = controller.selectedServiceTypes.isNotEmpty;

                return ButtonHapusRiwayattransaksi(
                  isActive: hasSelection,
                  onTap:
                      hasSelection
                          ? () {
                            controller.resetServiceFilter();
                          }
                          : null,
                );
              }),
            ],
          ),
          SizedBox(height: 20),

          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 10,
              childAspectRatio: 1.05,
            ),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              final TransactionType serviceType =
                  service['type'] as TransactionType;

              return Obx(() {
                final bool isSelected = controller.selectedServiceTypes
                    .contains(serviceType);
                return _buildServiceItem(
                  service['icon'] as String,
                  service['name'] as String,
                  serviceType,
                  isSelected,
                );
              });
            },
          ),

          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              controller.applyServiceFilter();
              Get.back();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12),
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

  Widget _buildServiceItem(
    String iconPath,
    String name,
    TransactionType serviceType,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        controller.toggleServiceFilter(serviceType);
      },
      child: Container(
        child: Stack(
          children: [
            // Main content container dengan ukuran tetap
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Container untuk image dengan ukuran tetap
                  Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    child: Image.asset(
                      iconPath,
                      height: 48,
                      width: 48,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 15,
                    alignment: Alignment.topCenter,
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF626E7A),
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Check icon dengan posisi absolut
            if (isSelected)
              Positioned(
                top: 6,
                right: 15,
                child: Image.asset(
                  'assets/icon_checklayanan.png',
                  height: 14,
                  width: 14,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/button_lihatlainnya.dart';
import 'package:gopay_task/widgets/dottedline_curve.dart';
import 'package:gopay_task/models/promo_item_model.dart'; 

class PromoWithbutton extends StatelessWidget {
  final String title;
  final List<PromoItemModel> promoItems; 
  final String buttonText;
  final String buttonIconAsset;
  final Widget? destinationPage;
  
  const PromoWithbutton({
    Key? key,
    this.title = 'Promo Spesial untuk Pengguna Baru',
    required this.promoItems,
    this.buttonText = 'Lihat promo lainnya',
    this.buttonIconAsset = 'assets/iconbutton_promo.png',
    this.destinationPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.only(top: 8, bottom: 16),
            decoration: BoxDecoration(
              color: Color(0XFFFDFDFD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                
                
                for (int i = 0; i < promoItems.length; i++) ...[
                  _buildPromoItem(promoItems[i]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: DottedLineWithCurves(),
                  ),
                ],

                SizedBox(height: 5),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ButtonLihatlainnya(
                    text: buttonText, 
                    iconAssetPath: buttonIconAsset, 
                    destinationPage: destinationPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoItem(PromoItemModel item) { 
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color(0xFFEDEDED),
                width: 1,
              ),
            ),
            child: Center(
              child: Image.asset(
                item.logoAsset,
                height: 45,
                width: 45,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.minPayment,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF626E7A),
                    letterSpacing: -0.3,
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
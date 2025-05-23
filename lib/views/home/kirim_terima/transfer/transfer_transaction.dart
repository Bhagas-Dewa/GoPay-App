import 'package:flutter/material.dart';
import 'package:flutter_inset_shadow/flutter_inset_shadow.dart' as inset;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gopay_task/widgets/bottomsheet_akuntujuan.dart';
import 'package:gopay_task/widgets/custom_numpad.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';
import 'package:gopay_task/controllers/numpad_controller.dart';

class TransferTransaction extends StatefulWidget {
  final String? defaultPaymentMethod;

  TransferTransaction({super.key, this.defaultPaymentMethod});

  @override
  State<TransferTransaction> createState() => _TransferTransactionState();
}

class _TransferTransactionState extends State<TransferTransaction> {
  late TransactionController transactionController;
  late NumpadController numpadController;

  @override
  void initState() {
    super.initState();
    transactionController = Get.put(TransactionController());
    numpadController = Get.put(NumpadController());

    if (widget.defaultPaymentMethod != null) {
      transactionController.setPaymentMethodFromTransferPage(
        widget.defaultPaymentMethod!,
      );
    }

    numpadController.setCallbacks(
      onNumber: (String number) {
        transactionController.addNumber(number);
      },
      onBackspace: () {
        transactionController.removeLastCharacter();
      },
    );
  }

  @override
  void dispose() {
    Get.delete<TransactionController>();
    Get.delete<NumpadController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEFF3),
      body: Column(
        children: [
          // Appbar
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: MediaQuery.of(context).padding.top + 10,
              bottom: 10,
            ),
            decoration: BoxDecoration(
              color: Color(0xFFFDFDFD),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.close_rounded, size: 24),
                    ),
                    SizedBox(width: 15),
                    CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFFFFFFFF), Color(0xFFEDEDED)],
                            stops: [0.5, 1.0],
                          ),
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                            color: Color(0xFFEDEDED),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'B',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000000),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Bhagas',
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: -0.3,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.verified_rounded,
                              size: 16,
                              color: Color(0XFF01AED6),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Kirim bukti otomatis diaktifkan',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0XFF088C15),
                                letterSpacing: -0.3,
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.notifications,
                              size: 14,
                              color: Color(0XFF088C15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.more_vert_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
                  ],
                ),

                SizedBox(height: 15),

                // GestureDetector(
                //   onTap: () {
                //     //bottomsheet disini
                //     showModalBottomSheet(
                //       context: context,
                //       isScrollControlled: true,
                //       backgroundColor: Colors.transparent,
                //       builder: (context) {
                //         return Container(
                //           height: MediaQuery.of(context).size.height * 0.9,
                //           child: BottomsheetAkuntujuan(),
                //         );
                //       },
                //     );
                //   },
                //   //otomatis berubah ketika memilih metode pembayaran
                //   child: Container(
                //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(15),
                //       border: Border.all(color: Color(0xFFEEEFF3), width: 1),
                //     ),
                //     child: Row(
                //       children: [
                //         Container(
                //           padding: EdgeInsets.all(4),
                //           decoration: BoxDecoration(
                //             border: Border.all(
                //               color: Color(0xFFEEEFF3),
                //               width: 1,
                //             ),
                //             color: Colors.white,
                //             shape: BoxShape.circle,
                //           ),
                //           child: Image.asset(
                //             'assets/circleicon_shopeepay.png',
                //             height: 22,
                //           ),
                //         ),
                //         SizedBox(width: 5),
                //         Text(
                //           'ShopeePay',
                //           style: GoogleFonts.inter(
                //             fontSize: 12,
                //             fontWeight: FontWeight.w600,
                //             color: Color(0xFF626E7A),
                //             letterSpacing: -0.3,
                //           ),
                //         ),
                //         SizedBox(width: 2),
                //         Expanded(
                //           child: Text(
                //             '+6281271236458',
                //             style: GoogleFonts.inter(
                //               fontSize: 12,
                //               fontWeight: FontWeight.w400,
                //               color: Color(0xFF626E7A),
                //               letterSpacing: -0.3,
                //             ),
                //             maxLines: 1,
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //         ),
                //         SizedBox(width: 5),
                //         Expanded(
                //           child: Text(
                //             '•Bxxxxxxxxxxx4',
                //             style: GoogleFonts.inter(
                //               fontSize: 12,
                //               fontWeight: FontWeight.w400,
                //               color: Color(0xFF626E7A),
                //               letterSpacing: -0.3,
                //             ),
                //             maxLines: 1,
                //             overflow: TextOverflow.ellipsis,
                //           ),
                //         ),
                //         SizedBox(width: 15),
                //         Icon(Icons.keyboard_arrow_down_rounded, size: 24),
                //       ],
                //     ),
                //   ),
                // ),
                 _buildPaymentMethodContainer(),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Nominal
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: _buildNominal(),
          ),

          SizedBox(height: 15),

          // Numpad and Button
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: CustomNumpad(
                      onNumberPressed: (String number) {
                        print('Number pressed: $number');
                        transactionController.addNumber(number);
                      },
                      onBackspacePressed: () {
                        print('Backspace pressed');
                        transactionController.removeLastCharacter();
                      },
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildButtonReview(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNominal() {
    return Container(
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
                stops: [0.1, 0.4],
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
            child: Center(
              child: Obx(
                () => Text(
                  transactionController.formattedNominal,
                  style: GoogleFonts.lora(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.3,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Color(0xFFEEEFF3), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/icon_chat.png', height: 24),
                SizedBox(width: 5),
                Text(
                  'Tulis pesan disini',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF626E7A),
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

  Widget _buildButtonReview() {
    return Obx(
      () => GestureDetector(
        onTap:
            transactionController.isReviewButtonActive
                ? () {
                  print(
                    'Review transfer with amount: ${transactionController.formattedNominal}',
                  );
                }
                : null,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient:
                transactionController.isReviewButtonActive
                    ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0XFF5DB466), Color(0XFF088C15)],
                      stops: [0.0, 1.0],
                    )
                    : LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFE2E5EA), Color(0xFF9E9E9E)],
                      stops: [0.0, 1.0],
                    ),
            borderRadius: BorderRadius.circular(45),
          ),
          child: Text(
            'Review Transfer',
            style: GoogleFonts.inter(
              fontSize: 16,
              color:
                  transactionController.isReviewButtonActive
                      ? Colors.white
                      : Colors.white70,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodContainer() {
    return Obx(() {
      final selectedMethod = transactionController.selectedPaymentMethod;

      if (selectedMethod == null) {
        // Fallback jika tidak ada method yang dipilih
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFEEEFF3), width: 1),
          ),
          child: Text(
            'Pilih metode pembayaran',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF626E7A),
              letterSpacing: -0.3,
            ),
          ),
        );
      }

      // Return a default widget if selectedMethod is not null
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: BottomsheetAkuntujuan(),
              );
            },
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFEEEFF3), width: 1),
          ),
          child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFEEEFF3),
                              width: 1,
                            ),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            selectedMethod.iconPath,
                            height: 22,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                        selectedMethod.name,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF626E7A),
                            letterSpacing: -0.3,
                          ),
                        ),
                        SizedBox(width: 2),
                        if (selectedMethod.accountNumber.isNotEmpty) ...[
                        Expanded(
                          child: Text(
                            selectedMethod.accountNumber,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            selectedMethod.accountName,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF626E7A),
                              letterSpacing: -0.3,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 15),
                        Icon(Icons.keyboard_arrow_down_rounded, size: 24),
                        ],
                      ],
                    ),
        ),
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/views/home/kirim_terima/transfer/transfer_transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/test_helpers.dart';

void main() {
  group('TransferTransaction Widget Tests', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});

      TestHelpers.setupControllers();
      Get.find<GopaySaldoController>().setInitialBalance(100000);
    });

    tearDown(() {
      TestHelpers.cleanupControllers();
    });

    testWidgets('should display TransferTransaction with default elements', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(
        1080,
        1920,
      ); 
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        TestHelpers.createTestWidget(TransferTransaction()),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.close_rounded), findsOneWidget);
      expect(find.text('Bhagas'), findsOneWidget);
      expect(find.text('Rp'), findsOneWidget);
      expect(find.text('Tulis pesan disini'), findsOneWidget);
      expect(find.text('Review Transfer'), findsOneWidget);
    });

    testWidgets(
      'should update amount when numpad is used and backspace works',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(
          1080,
          1920,
        );
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          TestHelpers.createTestWidget(TransferTransaction()),
        );
        await tester.pumpAndSettle();

        await tester.tap(find.text('1'));
        await tester.pump();
        await tester.tap(find.text('5'));
        await tester.pump();
        await tester.tap(find.text('0'));
        await tester.pump();

        expect(find.text('Rp150'), findsOneWidget);

        final backspaceButtonFinder = find.text('⌫');
        expect(backspaceButtonFinder, findsOneWidget);
        await tester.tap(backspaceButtonFinder);
        await tester.pump();

        expect(find.text('Rp15'), findsOneWidget);
      },
    );


    testWidgets(
      'Review Transfer button should be enabled only when amount is greater than 0',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2340);
        tester.view.devicePixelRatio = 1.0;

        await tester.pumpWidget(
          TestHelpers.createTestWidget(TransferTransaction()),
        );
        await tester.pumpAndSettle();

        final reviewButton = find.widgetWithText(
          GestureDetector,
          'Review Transfer',
        );

        expect(tester.widget<GestureDetector>(reviewButton).onTap, isNull);

        await tester.tap(find.text('5'));
        await tester.pump();

        expect(tester.widget<GestureDetector>(reviewButton).onTap, isNotNull);

        final backspaceButtonFinder = find.text(
          '⌫',
        ); 
        expect(backspaceButtonFinder, findsOneWidget);
        await tester.tap(backspaceButtonFinder);
        await tester.pump();

        expect(tester.widget<GestureDetector>(reviewButton).onTap, isNull);
      },
    );

    testWidgets('should switch to confirmation view on "Review Transfer" tap', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(
        1080,
        1920,
      );
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        TestHelpers.createTestWidget(TransferTransaction()),
      );
      await tester.pumpAndSettle();

      // Act - Masukkan nominal dan klik review
      await tester.tap(find.text('5'));
      await tester.tap(find.text('0'));
      await tester.tap(find.text('0'));
      await tester.tap(find.text('0'));
      await tester.pump();

      await tester.tap(find.text('Review Transfer'));
      await tester.pumpAndSettle();

      expect(find.byType(CustomNumpad), findsNothing); 
      expect(find.text('Transfer'), findsOneWidget); 
      expect(find.byIcon(Icons.edit), findsOneWidget); 
      expect(find.textContaining('GoPay'), findsOneWidget); 
    });

    testWidgets('should switch back to input view when edit icon is tapped', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 1.0;

      await tester.pumpWidget(
        TestHelpers.createTestWidget(TransferTransaction()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('5'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();

      await tester.tap(find.text('Review Transfer'));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.edit));
      await tester.pumpAndSettle();

      final transactionController = Get.find<TransactionController>();
      expect(transactionController.formattedNominal, 'Rp50');
    });

    testWidgets('should have correct state when saldo is not enough', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2340);
      tester.view.devicePixelRatio = 1.0;

      Get.find<GopaySaldoController>().setInitialBalance(
        10000,
      ); 

      await tester.pumpWidget(
        TestHelpers.createTestWidget(TransferTransaction()),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('2'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();
      await tester.tap(find.text('0'));
      await tester.pump();

      await tester.tap(find.text('Review Transfer'));
      await tester.pumpAndSettle();

      final transactionController = Get.find<TransactionController>();

      expect(transactionController.hasSufficientSaldo, isFalse);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart'; 
import 'package:gopay_task/views/home/kirim_terima/transfer/transfer_page.dart';
import 'package:gopay_task/views/home/kirim_terima/transfer/transfer_transaction.dart';
import '../helper/test_helpers.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    TestHelpers.setupControllers();
  });

  tearDown(() {
    TestHelpers.cleanupControllers();
  });

  group('TransferPage Widget Tests', () {
    testWidgets('should display TransferPage with all main elements',
        (WidgetTester tester) async {

      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      TestHelpers.verifyTextExists('Transfer');
      TestHelpers.verifyTextExists('Ke akunmu');
      TestHelpers.verifyTextExists('Tambah');
      TestHelpers.verifyTextExists('Transfer ke orang lain');
      TestHelpers.verifyIconExists(Icons.help_outlined);
    });

    testWidgets('should display account receiver cards correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      TestHelpers.verifyTextExists('ShopeePay');
      TestHelpers.verifyTextExists('+628117936746');
      TestHelpers.verifyTextExists('BLU By BCA Digital');
      TestHelpers.verifyTextExists('006885249985');
    });

    testWidgets('should display transfer options (Banks, E-wallet, GoPay)',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      TestHelpers.verifyTextExists('Banks');
      TestHelpers.verifyTextExists('E-wallet');
      TestHelpers.verifyTextExists('GoPay');
    });

    testWidgets('should display search field with placeholder',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      expect(find.byType(TextField), findsOneWidget);
      expect(find.text('Ketik nama atau nomor HP'), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
    });

    testWidgets('should handle search input correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      final searchField = find.byType(TextField);
      await TestHelpers.enterText(tester, searchField, 'Bhagas');

      expect(find.text('Bhagas'), findsOneWidget);
    });

    testWidgets(
        'should navigate to TransferTransaction when ShopeePay account is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      final shopeePayCard = find.text('ShopeePay');
      expect(shopeePayCard, findsOneWidget);
      await tester.tap(shopeePayCard);
      await tester.pumpAndSettle(); 

      expect(find.byType(TransferTransaction), findsOneWidget);
      expect(find.textContaining('ShopeePay'), findsWidgets);
    });

    testWidgets(
        'should navigate to TransferTransaction when BLU account is tapped',
        (WidgetTester tester) async {
      await tester.pumpWidget(TestHelpers.createTestWidget(TransferPage()));
      await tester.pumpAndSettle();

      final bluCard = find.text('BLU By BCA Digital');
      expect(bluCard, findsOneWidget);
      await tester.tap(bluCard);
      await tester.pumpAndSettle();

      expect(find.byType(TransferTransaction), findsOneWidget);

      expect(find.textContaining('Blu'), findsWidgets);
    });
  });
}
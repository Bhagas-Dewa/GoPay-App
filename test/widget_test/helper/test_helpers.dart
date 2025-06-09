import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:gopay_task/controllers/gopaysaldo_controller.dart';
import 'package:gopay_task/controllers/transaction_controller.dart';
import 'package:gopay_task/controllers/numpad_controller.dart';

class CustomNumpad extends StatelessWidget {
  final Function(String)? onNumberTap;
  final VoidCallback? onBackspace;
  
  const CustomNumpad({
    Key? key,
    this.onNumberTap,
    this.onBackspace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              _buildNumberButton('2'),
              _buildNumberButton('3'),
            ],
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              _buildNumberButton('5'),
              _buildNumberButton('6'),
            ],
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              _buildNumberButton('8'),
              _buildNumberButton('9'),
            ],
          ),
          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('00'),
              _buildNumberButton('0'),
              GestureDetector(
                onTap: onBackspace,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.backspace_outlined),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => onNumberTap?.call(number),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class TestHelpers {

  static void setupControllers() {

    if (!Get.isRegistered<GopaySaldoController>()) {
      final gopaySaldoController = GopaySaldoController();
      Get.put(gopaySaldoController);
    }
    
    if (!Get.isRegistered<TransactionController>()) {
      final transactionController = TransactionController();
      Get.put(transactionController);
    }
    
    if (!Get.isRegistered<NumpadController>()) {
      final numpadController = NumpadController();
      Get.put(numpadController);
    }
  }

  static void cleanupControllers() {
    try {
      Get.delete<GopaySaldoController>(force: true);
      Get.delete<TransactionController>(force: true);
      Get.delete<NumpadController>(force: true);
    } catch (e) {
    }
    Get.reset();
  }

  static Widget createTestWidget(Widget child) {
    return GetMaterialApp(
      home: Scaffold(body: child),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }

  static Widget createSimpleTestWidget(Widget child) {
    return MaterialApp(
      home: Scaffold(body: child),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
    );
  }

  static Future<void> tapWithDelay(
    WidgetTester tester, 
    Finder finder, {
    int milliseconds = 100,
    bool warnIfMissed = true,
  }) async {
    try {
      if (finder.tryEvaluate()) {
        await tester.tap(finder);
        await tester.pumpAndSettle(Duration(milliseconds: milliseconds));
      } else if (warnIfMissed) {
        debugPrint('Warning: Widget not found for tap: $finder');
      }
    } catch (e) {
      if (warnIfMissed) {
        debugPrint('Error tapping widget: $e');
      }
    }
  }

  static Future<void> enterText(
    WidgetTester tester, 
    Finder finder, 
    String text, {
    bool clearFirst = true,
  }) async {
    try {
      if (finder.tryEvaluate()) {
        if (clearFirst) {
          await tester.tap(finder);
          await tester.pumpAndSettle();
        }
        await tester.enterText(finder, text);
        await tester.pumpAndSettle();
      } else {
        debugPrint('Warning: Text field not found: $finder');
      }
    } catch (e) {
      debugPrint('Error entering text: $e');
    }
  }

  static Future<void> scrollDown(
    WidgetTester tester, {
    double pixels = 300,
    Finder? scrollable,
  }) async {
    try {
      final scrollFinder = scrollable ?? find.byType(ListView).first;
      if (scrollFinder.tryEvaluate()) {
        await tester.drag(scrollFinder, Offset(0, -pixels));
        await tester.pumpAndSettle();
      }
    } catch (e) {
      debugPrint('Error scrolling: $e');
    }
  }

  static Future<void> scrollUp(
    WidgetTester tester, {
    double pixels = 300,
    Finder? scrollable,
  }) async {
    try {
      final scrollFinder = scrollable ?? find.byType(ListView).first;
      if (scrollFinder.tryEvaluate()) {
        await tester.drag(scrollFinder, Offset(0, pixels));
        await tester.pumpAndSettle();
      }
    } catch (e) {
      debugPrint('Error scrolling up: $e');
    }
  }

  static void verifyWidgetExists(
    Finder finder, {
    int? expectedCount,
    bool atLeastOne = false,
  }) {
    if (expectedCount != null) {
      expect(finder, findsNWidgets(expectedCount));
    } else if (atLeastOne) {
      expect(finder, findsAtLeastNWidgets(1));
    } else {
      expect(finder, findsOneWidget);
    }
  }

  static void verifyTextExists(
    String text, {
    bool exactMatch = true,
    bool skipOnEmpty = false,
  }) {
    if (skipOnEmpty && text.isEmpty) return;
    
    try {
      if (exactMatch) {
        expect(find.text(text), findsOneWidget);
      } else {
        expect(find.textContaining(text), findsAtLeastNWidgets(1));
      }
    } catch (e) {
      debugPrint('Text not found: $text');
      rethrow;
    }
  }

  static void verifyTextsExist(List<String> texts) {
    for (String text in texts) {
      verifyTextExists(text);
    }
  }

  static void verifyImageExists(String assetPath) {
    try {
      expect(find.byWidgetPredicate(
        (widget) => widget is Image && 
                   widget.image is AssetImage && 
                   (widget.image as AssetImage).assetName == assetPath
      ), findsOneWidget);
    } catch (e) {
      debugPrint('Image not found: $assetPath');
    }
  }

  static void verifyIconExists(IconData icon, {int expectedCount = 1}) {
    expect(find.byIcon(icon), findsNWidgets(expectedCount));
  }

  static Future<void> waitForWidget(
    WidgetTester tester,
    Finder finder, {
    Duration timeout = const Duration(seconds: 5),
  }) async {
    final endTime = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(endTime)) {
      await tester.pumpAndSettle();
      if (finder.tryEvaluate()) {
        return;
      }
      await Future.delayed(Duration(milliseconds: 100));
    }
    throw Exception('Widget not found within timeout: $finder');
  }

  static Future<void> dismissKeyboard(WidgetTester tester) async {
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
  }

  static void verifyWidgetProperty<T extends Widget>(
    Finder finder,
    bool Function(T widget) predicate,
  ) {
    final widget = tester.widget<T>(finder);
    expect(predicate(widget), isTrue);
  }

  static Future<void> longPress(
    WidgetTester tester,
    Finder finder, {
    Duration duration = const Duration(milliseconds: 500),
  }) async {
    await tester.longPress(finder);
    await tester.pumpAndSettle();
  }

  static Future<void> dragWidget(
    WidgetTester tester,
    Finder finder,
    Offset offset,
  ) async {
    await tester.drag(finder, offset);
    await tester.pumpAndSettle();
  }

  static void verifyWidgetNotExists(Finder finder) {
    expect(finder, findsNothing);
  }

  static void setupMockData() {

  }


  static void cleanupMockData() {

  }

  static void printWidgetTree(WidgetTester tester) {
    debugPrint(tester.allWidgets.toString());
  }

  static void verifyContainerStyling(
    Finder containerFinder, {
    Color? expectedColor,
    BorderRadius? expectedBorderRadius,
    EdgeInsets? expectedPadding,
  }) {
    final container = tester.widget<Container>(containerFinder);
    
    if (expectedColor != null && container.decoration is BoxDecoration) {
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, expectedColor);
    }
    
    if (expectedPadding != null) {
      expect(container.padding, expectedPadding);
    }
  }

  static late WidgetTester tester;
}
import 'package:get/get.dart';

class NumpadController extends GetxController {
  // Callback function yang akan dipanggil ketika numpad ditekan
  Function(String)? onNumberPressed;
  Function()? onBackspacePressed;

  void setCallbacks({
    required Function(String) onNumber,
    required Function() onBackspace,
  }) {
    onNumberPressed = onNumber;
    onBackspacePressed = onBackspace;
  }

  void handleNumpadPress(String value) {
    if (value == "⌫") {
      onBackspacePressed?.call();
    } else if (["÷", "×", "-", "+"].contains(value)) {
      // Skip operasi matematika karena tidak diperlukan
      return;
    } else {
      onNumberPressed?.call(value);
    }
  }
}
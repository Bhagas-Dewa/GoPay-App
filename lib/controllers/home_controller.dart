import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxBool _isEyesOpen = true.obs;

  bool get isEyesOpen => _isEyesOpen.value;

  void toggleEyes() {
    _isEyesOpen.value = !_isEyesOpen.value;
    print('Eyes toggled: ${_isEyesOpen.value}'); // Debug log
  }

  String getBalanceText() {
    return _isEyesOpen.value ? 'Rp100.000' : 'Rp • • • • •';
  }

  String getCoinsText() {
    return _isEyesOpen.value ? 'Coins 0' : 'Coins • • •';
  }

  String getEyesAsset() {
    return _isEyesOpen.value
        ? 'assets/eyes_true.png'
        : 'assets/eyes_false.png';
  }
}

import 'package:get/get.dart';

class ToggleController extends GetxController {
  var isToggled = false.obs;

  void toggle() {
    isToggled.value = !isToggled.value;
  }

  void setToggle(bool value) {
    isToggled.value = value;
  }
}
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:torch_light/torch_light.dart';

class QrisController extends GetxController {
  var isFlashOn = false.obs;
  var imagePath = ''.obs;

  Future<void> toggleFlash() async {
    try {
      if (isFlashOn.value) {
        await TorchLight.disableTorch();
        isFlashOn.value = false;
      } else {
        await TorchLight.enableTorch();
        isFlashOn.value = true;
      }
    } catch (e) {
      print('Flash toggle error: $e');
    }
  }

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      imagePath.value = pickedImage.path;
    }
  }
}

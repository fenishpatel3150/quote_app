import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxString selectedImage = 'assets/image4.jpeg'.obs; // Initialize with an empty string

  void setImage(String imagePath) {
    selectedImage.value = imagePath;
  }
}
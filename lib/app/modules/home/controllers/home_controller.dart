import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString username = ''.obs;

  // Metode untuk menyimpan informasi pengguna yang masuk
  void setUserLoggedIn(String username) {
    this.username.value = username;
    // Simpan informasi pengguna ke penyimpanan lokal jika perlu
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  RxString nama = 'nama'.obs;
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
    nama = StorageProvider.read(StorageKey.username).obs;
    print(nama);
    update();

  }

  @override
  void onReady() {
    super.onReady();
    nama = StorageProvider.read(StorageKey.username).obs;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

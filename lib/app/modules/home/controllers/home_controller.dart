import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
<<<<<<< HEAD
  RxString nama = 'nama'.obs;
=======
  RxString username = ''.obs;

  // Metode untuk menyimpan informasi pengguna yang masuk
  void setUserLoggedIn(String username) {
    this.username.value = username;
    // Simpan informasi pengguna ke penyimpanan lokal jika perlu
  }
>>>>>>> origin/main


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
<<<<<<< HEAD
    nama = StorageProvider.read(StorageKey.username).obs;
    print(nama);
    update();
=======
>>>>>>> origin/main

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

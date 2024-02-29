import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  RxString nama = 'nama'.obs;


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

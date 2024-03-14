import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController with StateMixin<List<DataBook>>{
  //TODO: Implement HomeController
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
    getDataBook();

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
  Future<void> getDataBook() async{
    change(null, status: RxStatus.loading());

    try {

      final response = await ApiProvider.instance().get(Endpoint.book,);
      if (response.statusCode == 200) {
        final ResponseBook responseBuku = ResponseBook.fromJson(response.data);
        if(responseBuku.data!.isEmpty){
          change(null, status: RxStatus.empty());
        }else{
          change(responseBuku.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

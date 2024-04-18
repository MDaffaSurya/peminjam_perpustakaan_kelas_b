import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_getpeminjaman.dart';


import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class HistoryPinjamController extends GetxController with StateMixin {
  //TODO: Implement HistoryPinjamController

  var datakoleksibuku = Rxn<List<DataResponse>>();

  final String iduser = StorageProvider.read(StorageKey.idUser);
  final loading = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getDataKoleksiBuku();
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

  Future<void> getDataKoleksiBuku() async {
    change(null, status: RxStatus.loading());

    try {
      final responseKoleksiBuku = await ApiProvider.instance().get('${Endpoint.pinjam}/$iduser');

      if (responseKoleksiBuku.statusCode == 200) {
        ResponseGetpeminjaman responseBuku =
        ResponseGetpeminjaman.fromJson(responseKoleksiBuku.data);

        if (responseBuku.data == null) {
          print(responseKoleksiBuku.data);
          change(null, status: RxStatus.empty());
        } else {
          datakoleksibuku(responseBuku.data);
          change(datakoleksibuku, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioError catch (e) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

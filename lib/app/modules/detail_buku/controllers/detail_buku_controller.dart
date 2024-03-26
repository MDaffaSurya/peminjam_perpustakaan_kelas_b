import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_detail_book.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class DetailBukuController extends GetxController with StateMixin {
  var datadetalbuku = Rxn<Datadetailbook>();
  final id = Get.parameters['id'];
  //TODO: Implement DetailBukuController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDataDetailBuku(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataDetailBuku(String? idBuku) async {
    change(null, status: RxStatus.loading());

    try {
      final responseDetailBuku = await ApiProvider.instance().get(
          '${Endpoint.detaibook}/$idBuku');

      if (responseDetailBuku.statusCode == 200) {
        final ResponseDetailBook responseBuku = ResponseDetailBook.fromJson(responseDetailBuku.data);

        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          datadetalbuku(responseBuku.data);
          change(null, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioException catch (e) {
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

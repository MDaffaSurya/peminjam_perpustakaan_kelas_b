import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_search.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PencarianController extends GetxController with StateMixin {
  var searchBook = RxList<Datasearch>();

  final TextEditingController searchController = TextEditingController();

  final count = 0.obs;

  @override
  void onInit() {
    getDataSearchBook();
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

  Future<void> getDataSearchBook() async {
    try {
      change(null, status: RxStatus.loading()); // Ubah status menjadi loading

      final keyword = searchController.text.toString();
      final response;

      if (keyword == '') {
        response = await ApiProvider.instance().get('${Endpoint.search}all/buku/null');
      } else {
        response = await ApiProvider.instance().get('${Endpoint.search}all/buku/$keyword');
      }

      if (response.statusCode == 200) {
        final responseData = ResponseSearch.fromJson(response.data);

        if (responseData.data!.isEmpty) {
          searchBook.clear();
          change(null, status: RxStatus.empty());
        } else {
          searchBook.assignAll(responseData.data!);
          change(null, status: RxStatus.success());
        }
      } else {
        // Tangani kasus jika status kode respons bukan 200
        change(null, status: RxStatus.error("Gagal Memanggil Data"));
      }
    } on DioError catch (e) {
      // Tangani kesalahan jika terjadi kesalahan dengan Dio
      handleError(e);
    } catch (e) {
      // Tangani kesalahan lainnya
      handleError(e);
    }
  }

  void handleError(dynamic e) {
    if (e is DioError) {
      if (e.response != null) {
        final responseData = e.response?.data;
        if (responseData != null) {
          final errorMessage = responseData['Message'] ?? "Unknown error";
          change(null, status: RxStatus.error(errorMessage));
        }
      } else {
        change(null, status: RxStatus.error(e.message));
      }
    } else {
      change(null, status: RxStatus.error(e.toString()));
    }

    // Tampilkan snackbar ketika terjadi kesalahan
    Get.snackbar(
      'Error',
      'Failed to load data. Please try again later.',
      snackPosition: SnackPosition.TOP,
    );
  }

  void increment() => count.value++;
}

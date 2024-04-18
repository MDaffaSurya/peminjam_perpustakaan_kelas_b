import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_History_peminjaman.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_pinjam.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';


class PeminjamanController extends GetxController with StateMixin {
  //TODO: Implement PeminjamanController

  var datakoleksibuku = RxList<DataHistoryPeminjaman>();

  final String iduser = StorageProvider.read(StorageKey.idUser);
  final loading = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    getDataKoleksiBuku();
    super.onInit();
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
          "${Endpoint.pinjam}/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(
            response.data);
        if (responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responsePinjam.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(
              null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
  Future<void> getDataKoleksiBuku() async {
    change(null, status: RxStatus.loading());

    try {
      final responseKoleksiBuku = await ApiProvider.instance()
          .get('${Endpoint.pinjam}/$iduser');

      if (responseKoleksiBuku.statusCode == 200) {
        final ResponseHistoryPeminjaman responseBuku =
        ResponseHistoryPeminjaman.fromJson(responseKoleksiBuku.data);

        if (responseBuku.data!.isEmpty) {

          change(null, status: RxStatus.empty());
        } else {
          datakoleksibuku(responseBuku.data!);
          change(null, status: RxStatus.success());
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

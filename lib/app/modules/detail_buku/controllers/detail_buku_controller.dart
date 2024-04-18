import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/model/response_detail_book.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class DetailBukuController extends GetxController with StateMixin {
  var datadetalbuku = Rxn<Datadetailbook>();
  final id = Get.parameters['id'];

  final loading = false.obs;
  final loadingpinjam = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ulasanController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  // Variabel untuk menyimpan ulasan yang akan dikirim
  final reviewController = TextEditingController();
  final userRating = 0.0.obs;

  late String formattedToday;
  late String formattedTwoWeeksLater;

  @override
  void onInit() {
    super.onInit();
    // Get Tanggal hari ini
    DateTime todayDay = DateTime.now();

    // Menambahkan 14 hari ke tanggal hari ini
    DateTime twoWeeksLater = todayDay.add(const Duration(days: 14));

    // Format tanggal menjadi string menggunakan intl package
    formattedToday = DateFormat('yyyy-MM-dd').format(todayDay);
    formattedTwoWeeksLater = DateFormat('yyyy-MM-dd').format(twoWeeksLater);
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

  // Fungsi untuk mendapatkan detail buku
  Future<void> getDataDetailBuku(String? idBuku) async {
    change(null, status: RxStatus.loading());

    try {
      final responseDetailBuku = await ApiProvider.instance()
          .get('${Endpoint.detaibook}/$idBuku');

      if (responseDetailBuku.statusCode == 200) {
        final ResponseDetailBook responseBuku =
        ResponseDetailBook.fromJson(responseDetailBuku.data);

        if (responseBuku.data == null) {
          change(null, status: RxStatus.empty());
        } else {
          datadetalbuku(responseBuku.data);
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

  // Fungsi untuk menambah ulasan
  Future<void> addReview() async {
    try {
      final review = reviewController.text.trim();
      final rating = userRating.value;

      // Validasi ulasan dan rating sebelum mengirim
      if (review.isEmpty) {
        Get.snackbar('Error', 'Ulasan tidak boleh kosong',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      // Lakukan penanganan untuk mengirim ulasan ke server
      // Misalnya, Anda bisa menggunakan API post untuk mengirim ulasan

      // Setelah berhasil mengirim ulasan, reset nilai inputan dan rating
      reviewController.text = '';
      userRating.value = 0.0;

      // Beritahu pengguna bahwa ulasan telah berhasil ditambahkan
      Get.snackbar('Success', 'Ulasan berhasil ditambahkan',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      // Tangani kesalahan jika gagal menambah ulasan
      Get.snackbar('Error', 'Gagal menambah ulasan: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  ulasan() async{
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.ulasan,
            data: {
              "BukuID": Get.parameters['id'],
              "Ulasan": ulasanController.text.toString(),
              "Rating": userRating.value,

            });
        if(response.statusCode == 201){
          final id = Get.parameters['id'];
          getDataDetailBuku(id);
          Get.snackbar("Success 👍", "ulasan berhasil", backgroundColor: Colors.green);
          ulasanController.text = "";
          userRating.value = 0;
        } else {
          Get.snackbar("Sorry", "ulasan Gagal",backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on DioException catch(e){
      loading(false);
      if (e.response!= null){
        if (e.response?.data!= null){
          Get.snackbar("Sorry", "${e.response?.data['message']}",backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "",backgroundColor: Colors.red);
      }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
  simpanbuku() async{
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      var userID = StorageProvider.read(StorageKey.idUser).toString();
      var bukuID = Get.parameters['id'].toString();

      var response = await ApiProvider.instance().post(
        Endpoint.koleksi,
        data: {
          "UserID": userID,
          "BukuID": bukuID,
        },
      );
      if(response.statusCode == 201){
        getDataDetailBuku(id);
        Get.snackbar("Success 👍", "simpan berhasil", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Sorry", "simpan Gagal",backgroundColor: Colors.orange);
      }
      loading(false);
    } on DioException catch(e){
      loading(false);
      if (e.response!= null){
        if (e.response?.data!= null){
          Get.snackbar("Sorry", "${e.response?.data['message']}",backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "",backgroundColor: Colors.red);
      }
    } catch (e) {loading(false);
    Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
  pinjam(String idbuku) async {
    loadingpinjam(true);
    try {
      FocusScope.of(Get.context!).unfocus();

      var response = await ApiProvider.instance().post(
        Endpoint.pinjam,
        data: {
          "BukuID": idbuku,
        },
      );
      if (response.statusCode == 200) {
        getDataDetailBuku(id);
        Get.snackbar(
            "Success 👍", "pinjam berhasil", backgroundColor: Colors.green);
      } else {
        Get.snackbar("Sorry", "pinjam Gagal", backgroundColor: Colors.orange);
      }
      loadingpinjam(false);
    } on DioException catch (e) {
      loadingpinjam(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loadingpinjam(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}


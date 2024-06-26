// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
// import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';
// import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/storage_provider.dart';
//
// class AddPeminjamanController extends GetxController {
//   final loading = false.obs;
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController tanggalPinjamController = TextEditingController();
//   final TextEditingController tanggalKembaliController = TextEditingController();
//
//   final count = 0.obs;
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   register() async{
//     loading(true);
//     try{
//       FocusScope.of(Get.context!).unfocus();
//       formKey.currentState?.save();
//       if (formKey.currentState!.validate()){
//         final response = await ApiProvider.instance().post(Endpoint.addpinjam,
//             data: {
//               "user_id": StorageProvider.read(StorageKey.idUser),
//               "book_id": Get.parameters['id'],
//               "tanggal_pinjam": tanggalPinjamController.text.toString(),
//               "tanggal_kembali": tanggalKembaliController.text.toString(),
//
//             });
//         if(response.statusCode == 201){
//           Get.back();
//           Get.snackbar("Success 👍", "Peminjaman berhasil", backgroundColor: Colors.green);
//         } else {
//           Get.snackbar("Sorry", "Peminjaman Gagal",backgroundColor: Colors.orange);
//         }
//       }
//       loading(false);
//     } on DioException catch(e){
//       loading(false);
//       if (e.response!= null){
//         if (e.response?.data!= null){
//           Get.snackbar("Sorry", "${e.response?.data['message']}",backgroundColor: Colors.orange);
//         }
//       } else {
//         Get.snackbar("Sorry", e.message ?? "",backgroundColor: Colors.red);
//       }
//     } catch (e) {loading(false);
//     Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
//     }
//   }
// }

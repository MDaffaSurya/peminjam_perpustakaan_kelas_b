
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/data/provider/api_provider.dart';

import '../../../routes/app_pages.dart';


class RegisterController extends GetxController {
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nama_lengkapController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
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

  register() async{
    loading(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: {
              "username": usernameController.text.toString(),
              "email": emailController.text.toString(),
              "password": passwordController.text.toString(),
              "nama_lengkap": nama_lengkapController.text.toString(),
              "alamat": alamatController.text.toString(),
            });
        if(response.statusCode == 201){
          Get.snackbar("Succes", "Register sukses",backgroundColor: Colors.green);
          Get.offAllNamed(Routes.LOGIN);

        } else {
          Get.snackbar("Sorry", "Register Gagal",backgroundColor: Colors.orange);
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
}

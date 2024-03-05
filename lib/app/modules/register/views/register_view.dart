import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '     Hi, Welcome Back! 👋',
                  textAlign: TextAlign.left, // Menjadikan teks rata kiri
                  style: GoogleFonts.manrope(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5,), // Jarak antara teks "Hi welcome" dan "Silahkan login"
                Text(
                  '         Hello again, you’ve been missed!',
                  textAlign: TextAlign.left, // Menjadikan teks rata kiri
                  style: GoogleFonts.manrope(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20,), // Jarak antara teks dan TextFormField pertama
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                      hintText: "Masukkan username",
=======
                      hintText: "Masukkan Nama",
>>>>>>> origin/main
                      // icon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value){
                      if (value!.length <1){
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
<<<<<<< HEAD
                      hintText: "Masukkan email",
=======
                      hintText: "Masukkan Username",
>>>>>>> origin/main
                      // icon: Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value){
                      if (value!.length <1){
                        return "Username tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
<<<<<<< HEAD
=======
                  child: TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(
                      hintText: "Masukkan No Telp",
                      // icon: Icon(Icons.phone),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value){
                      if (value!.length <2){
                        return "No Telp tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Alamat",
                      // icon: Icon(Icons.home),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value){
                      if (value!.length <2){
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
>>>>>>> origin/main
                  child: TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Password",
                      // icon: Icon(Icons.lock),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    validator: (value){
                      if (value!.length <2){
                        return "Password tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                ),
                Obx(() => controller.loading.value?
                CircularProgressIndicator():
                Center(
                  child: ElevatedButton(
                    onPressed: (){
                      controller.register();
                    },
                    child: Text("Daftar"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF351A96),
                      onPrimary: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sudah punya akun?"),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.LOGIN),
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Color(0xFF351A96),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

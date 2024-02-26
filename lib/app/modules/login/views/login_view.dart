import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/routes/app_pages.dart';
import 'package:google_fonts/google_fonts.dart';


import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // tambahkan crossAxisAlignment: CrossAxisAlignment.start
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '     Hi, Welcome 👋',
                    style: GoogleFonts.manrope(
                      fontSize: 25, fontWeight:FontWeight.w600
                    ),
                  ),

                  SizedBox(height: 5, width: 20,), // jarak antara teks "Hi welcome" dan "Silahkan login"
                  Text(
                    '         Hello again, you’ve been missed!',
                    style: GoogleFonts.manrope(
                      fontSize: 14, color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextFormField(
                        controller: controller.usernameController,
                        decoration: InputDecoration(
                          hintText: "Please Enter Your Username",
                          // icon: Icon(Icons.person),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.passwordObscureText.value,
                        decoration: InputDecoration(
                          hintText: "Please Enter Your Password",
                          // icon: Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "password tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ),


                    Obx(() => controller.loading.value
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: Text("Login"),
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
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Belum punya akun?"),
                        TextButton(
                            onPressed: () => Get.toNamed(Routes.REGISTER),
                            child: Text("Daftar"),
                            style: ElevatedButton.styleFrom(
                                onPrimary: Color(0xFF351A96)
                            )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

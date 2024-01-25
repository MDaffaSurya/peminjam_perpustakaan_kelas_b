import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        body: Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.namaController,
                    decoration: InputDecoration(hintText: "Masukkan Nama", icon: Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value){
                      if (value!.length <1){
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
        ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.usernameController,
                    decoration: InputDecoration(hintText: "Masukkan Username", icon: Icon(Icons.person), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value){
                      if (value!.length <1){
                        return "Username tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
        ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                 child: TextFormField(
                    controller: controller.telpController,
                    decoration: InputDecoration(hintText: "Masukkan No Telp",icon: Icon(Icons.phone), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value){
                      if (value!.length <2){
                        return "No Telp tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.alamatController,
                    decoration: InputDecoration(hintText: "Masukkan Alamat", icon: Icon(Icons.home), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (value){
                      if (value!.length <2){
                        return "Alamat tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextFormField(
                    controller: controller.passwordController,
                    decoration: InputDecoration(hintText: "Masukkan Password", icon: Icon(Icons.lock), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
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
                  ElevatedButton(onPressed: (){
                    controller.register();
                  }, child: Text("Daftar"))
                  )
                ],
              ),
            )
        )
    );
  }
}
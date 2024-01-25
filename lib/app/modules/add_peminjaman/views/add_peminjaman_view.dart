import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Pinjam Buku ${Get.parameters['judul'].toString()}'),
        centerTitle: true,
      ),
        body: Center(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: controller.tanggalPinjamController,
                      decoration: InputDecoration(hintText: "Masukkan tanggal pinjam", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      validator: (value){
                        if (value!.length <1){
                          return "tanggal tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: controller.tanggalKembaliController,
                      decoration: InputDecoration(hintText: "Masukkan tanggal kembali", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      validator: (value){
                        if (value!.length <1){
                          return "tanggal tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                  ),
                  Obx(() => controller.loading.value?
                  CircularProgressIndicator():
                  ElevatedButton(onPressed: (){
                    controller.register();
                  }, child: Text("pinjam"))
                  )
                ],
              ),
            )
        )
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("judul ${state[index].book?.judul}") ,
              subtitle:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Text("Tanggal pinjam ${state[index].tanggalPinjam}"),
                Text("Tanggal pinjam ${state[index].tanggalKembali}"),
              ],
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        ),),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Indeks halaman yang terpilih
        onTap: (index) {
          // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
          if (index == 0) {
            // Jika item pertama ditekan, navigasi ke halaman home
            Get.offAllNamed(Routes.HOME);
          } else if (index == 1) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.toNamed(Routes.BOOK);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk item pertama
            label: 'Home', // Label untuk item pertama
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Ikon untuk item kedua
            label: 'Book', // Label untuk item kedua
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books), // Ikon untuk item ketiga
            label: 'Peminjaman', // Label untuk item ketiga
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/koleksi_controller.dart';

class KoleksiView extends GetView<KoleksiController> {
  const KoleksiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KoleksiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'KoleksiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Indeks halaman yang terpilih
        onTap: (index) {
          // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
          if (index == 0) {
            // Jika item pertama ditekan, navigasi ke halaman home
            Get.offAllNamed(Routes.HOME);
          } else if (index == 1) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.toNamed(Routes.PENCARIAN);
          } else if (index == 2) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.toNamed(Routes.PEMINJAMAN);
          }
        },
        selectedItemColor: Colors.purple, // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk item pertama
            label: 'Home', // Label untuk item pertama
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Ikon untuk item kedua
            label: 'Book', // Label untuk item kedua
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books), // Ikon untuk item ketiga
            label: 'Peminjaman', // Label untuk item ketiga
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark), // Ikon untuk item ketiga
            label: 'koleksi', // Label untuk item ketiga
          ),
        ],
      ),
    );
  }
}

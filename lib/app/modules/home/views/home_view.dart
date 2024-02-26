import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Get.offAllNamed(Routes.LOGIN);
          },
              icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(Routes.BOOK);
              },
              icon: Icon(Icons.book),
              label: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Buku",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(Routes.PEMINJAMAN);
              },
              icon: Icon(Icons.library_books),
              label: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Peminjaman",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Indeks halaman yang terpilih
        onTap: (index) {
          // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
          if (index == 0) {
            // Jika item pertama ditekan, navigasi ke halaman home
            // Tidak perlu navigasi jika kita sudah berada di halaman home
            return;
          } else if (index == 1) {
            // Jika item kedua ditekan, navigasi ke halaman lain yang sesuai
            Get.toNamed(Routes.BOOK);
          } else if (index == 2) {
            // Jika item ketiga ditekan, navigasi ke halaman lain yang sesuai
            Get.toNamed(Routes.PEMINJAMAN);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk item pertama
            label: 'Home', // Label untuk item pertama
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book), // Ikon untuk item kedua
            label: 'Buku', // Label untuk item kedua
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_pages.dart';

class PencarianView extends StatelessWidget {
  const PencarianView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PencarianView'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            // child: IconButton(
            //   onPressed: () {},
            //   icon: Icon(Icons.search),
            // ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari buku...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.purple), // Warna border ungu
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                ),
                onChanged: (value) {
                  // Handle search logic here
                },
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'PencarianView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks halaman yang terpilih
        onTap: (index) {
          // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
          if (index == 0) {
            // Jika item pertama ditekan, navigasi ke halaman home
            Get.offAllNamed(Routes.HOME);
            return;
          } else if (index == 2) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.offAllNamed(Routes.HISTORY_PINJAM);
          }else if (index == 3) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.offAllNamed(Routes.KOLEKSI);
          }
        },
        selectedItemColor: Colors.purple, // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Ikon untuk item pertama
            label: '', // Label untuk item pertama
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), // Ikon untuk item kedua
            label: 'Search', // Label untuk item kedua
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books), // Ikon untuk item ketiga
            label: '', // Label untuk item ketiga
          ),BottomNavigationBarItem(
            icon: Icon(Icons.bookmark), // Ikon untuk item ketiga
            label: '', // Label untuk item ketiga
          ),
        ],
      ),
    );
  }
}

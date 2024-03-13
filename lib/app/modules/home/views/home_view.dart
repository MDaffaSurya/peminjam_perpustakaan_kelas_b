import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    SizedBox(width: 8),
                   Text('Hi, ${StorageProvider.read(StorageKey.username)}', style: TextStyle(fontSize: 24)),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  'What are you reading today?',
                  style: GoogleFonts.manrope(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ElevatedButton.icon(
          //   onPressed: () {
          //     Get.toNamed(Routes.BOOK);
          //   },
          //   icon: Icon(Icons.book),
          //   label: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Text(
          //       "Buku",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.blue,
          //     onPrimary: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 10),
          // ElevatedButton.icon(
          //   onPressed: () {
          //     Get.toNamed(Routes.PEMINJAMAN);
          //   },
          //   icon: Icon(Icons.library_books),
          //   label: Padding(
          //     padding: const EdgeInsets.all(20.0),
          //     child: Text(
          //       "Peminjaman",
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     primary: Colors.blue,
          //     onPrimary: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            return;
          } else if (index == 1) {
            Get.toNamed(Routes.BOOK);
          } else if (index == 2) {
            Get.toNamed(Routes.PEMINJAMAN);
          } else if (index == 3) {
            Get.toNamed(Routes.KOLEKSI);
          }
        },
        selectedItemColor: Colors.purple, // Warna ikon yang dipilih
        unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: '',
          ),
        ],
      ),
    );
  }
}

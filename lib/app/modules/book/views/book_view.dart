import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookView'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${state[index].judul}",
              style: TextStyle(fontSize: 18),
              ) ,
              subtitle: Text("Penulis: ${state[index].penulis}",
                style: TextStyle(fontSize: 14),
              ),
              trailing: ElevatedButton(
                child: Text("Pinjam"),
                onPressed: (){
                  Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                    'id': (state[index].id??0).toString(),
                    'judul': state[index].judul??"-"
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                      onPrimary: Colors.white,
                  padding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index){
            return Divider();
          },
        )),
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
            Get.toNamed(Routes.PEMINJAMAN);
          }else if (index == 3) {
            // Jika item ketiga ditekan, navigasi ke halaman Book
            Get.toNamed(Routes.KOLEKSI);
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
            icon: Icon(Icons.book), // Ikon untuk item kedua
            label: 'Buku', // Label untuk item kedua
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books), // Ikon untuk item ketiga
            label: '', // Label untuk item ketiga
          ),BottomNavigationBarItem(
            icon: Icon(Icons.collections), // Ikon untuk item ketiga
            label: '', // Label untuk item ketiga
          ),
        ],
      ),
    );
  }
}

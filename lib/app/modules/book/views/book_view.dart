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
      body: controller.obx(
            (state) => GridView.builder(
              scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Jumlah kolom
            crossAxisSpacing: 8, // Jarak antar kolom
            mainAxisSpacing: 8, // Jarak antar baris
          ),
          itemCount: state!.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  "${state[index].judul}",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Penulis: ${state[index].penulis}",
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      "Penerbit: ${state[index].penerbit}",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                onTap: () {
                  Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                    'id': (state[index].id ?? 0).toString(),
                    'judul': state[index].judul ?? "-"
                  });
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Indeks halaman yang terpilih
        onTap: (index) {
          // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
          if (index == 0) {
            // Jika item pertama ditekan, navigasi ke halaman home
            Get.offAllNamed(Routes.HOME);
          } else if (index == 2) {
            // Jika item ketiga ditekan, navigasi ke halaman peminjaman
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

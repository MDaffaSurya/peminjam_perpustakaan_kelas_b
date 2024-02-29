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
          scrollDirection: Axis.vertical, // Set to vertical scrolling
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Adjust the number of columns as needed
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7, // Adjust aspect ratio for card elongation
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
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Get.offAllNamed(Routes.HOME);
          } else if (index == 2) {
            Get.toNamed(Routes.PEMINJAMAN);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Peminjaman',
          ),
        ],
      ),
    );
  }
}

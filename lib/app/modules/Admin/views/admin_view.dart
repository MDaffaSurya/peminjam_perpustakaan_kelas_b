import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/admin_controller.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              // controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            TextField(
              // controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Di sini Anda dapat menambahkan logika untuk menambahkan buku ke daftar buku
                // Contoh: Anda dapat memanggil fungsi untuk menambahkan buku ke daftar
                // adminController.addBook(titleController.text, authorController.text);
                // Pastikan untuk mengambil instance dari controller yang sesuai
                // dengan struktur aplikasi Anda.
                // Juga, pastikan validasi untuk memeriksa apakah kedua bidang tidak kosong sebelum menambahkan buku.
                // Jika salah satu bidang kosong, Anda dapat menampilkan pesan kesalahan atau mengambil tindakan lain yang sesuai.
              },
              child: Text('Add Book'),
            ),
          ],
        ),
      ),
    );
  }
}

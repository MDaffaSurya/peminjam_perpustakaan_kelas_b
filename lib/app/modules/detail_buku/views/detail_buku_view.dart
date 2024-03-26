import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/detail_buku_controller.dart';

class DetailBukuView extends GetView<DetailBukuController> {
  const DetailBukuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Buku'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: sectionDetailbuku(),
      ),
    );
  }

  Widget sectionDetailbuku(){
    return Obx((){
      if (controller.datadetalbuku.isNull) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
          ),
        );
      } else if (controller.datadetalbuku.value == null) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
          ),
        );
      } else {
        var databuku = controller.datadetalbuku.value?.buku;
        var datakategori = controller.datadetalbuku.value?.kategori;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cover Buku
                Container(
                  height: 200, // Sesuaikan dengan tinggi yang diinginkan
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                  ),
                  child: Image.network(
                      databuku!.coverBuku.toString()
                  ),
                ),
                SizedBox(width: 20),
                // Informasi Buku
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        databuku.judul!,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'penulis: ${databuku.penulis!}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'penerbit: ${databuku.penerbit!}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'tahun terbit: ${databuku.tahunTerbit!}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        '⭐: ${databuku.rating!}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Logika ketika tombol "Pinjam" ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF351A96), // Ubah warna latar belakang
                              elevation: 3, // Ketebalan bayangan
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Bentuk tombol
                              ),
                            ),
                            child: Text(
                              'Pinjam',
                              style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                            ), // Teks tombol
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Logika ketika tombol "Simpan" ditekan
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey, // Warna latar belakang
                              elevation: 3, // Ketebalan bayangan
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8), // Bentuk tombol
                              ),
                            ),
                            child: Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white), // Ubah warna teks menjadi putih
                            ), // Teks tombol
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Deskripsi
            Text(
              'Deskripsi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              databuku.deskripsi!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      }
    });
  }
}

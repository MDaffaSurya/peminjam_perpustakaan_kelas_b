// Import yang diperlukan
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
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
        child: sectionDetailBuku(),
      ),
    );
  }

  Widget sectionDetailBuku() {
    return Obx(() {
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
        return SingleChildScrollView(
          child: Column(
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
                      databuku!.coverBuku.toString(),
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
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF828282),
                          ),
                        ),
                        Text(
                          'penerbit: ${databuku.penerbit!}',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF828282),
                          ),
                        ),
                        Text(
                          'tahun terbit: ${databuku.tahunTerbit!}',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF828282),
                          ),
                        ),
                        Text(
                          'jumlah halaman: ${databuku.jumlahHalaman!}',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF828282),
                          ),
                        ),
                        Row(
                          children: [
                            // Text(
                            //   'Rating: ${databuku.rating!}',
                            //   style: TextStyle(fontSize: 16),
                            // ),
                            SizedBox(width: 5),
                            RatingBar.builder(
                              initialRating: databuku.rating!,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 20,
                              itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
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
                '${databuku.deskripsi!}',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF828282),
                ),
              ),
              SizedBox(height: 20),
              // Ulasan
              Text(
                'Ulasan:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.datadetalbuku.value?.ulasan?.length ?? 0,
                itemBuilder: (context, index) {
                  var ulasan = controller.datadetalbuku.value?.ulasan?[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ulasan?.users?.username ?? ""}:',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ulasan?.ulasan ?? "",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 5),
                          RatingBar.builder(
                            initialRating: ulasan?.rating ?? 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              // Do nothing
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              // Form untuk menambah ulasan
              Form(
                key: controller.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tambah Ulasan:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        controller: controller.ulasanController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Tulis ulasan Anda di sini...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      RatingBar.builder(
                        initialRating: controller.userRating.value,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 30,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          controller.userRating.value = rating;
                        },
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Panggil fungsi untuk menambah ulasan
                          controller.ulasan();
                        },
                        child: Text('Kirim Ulasan'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}

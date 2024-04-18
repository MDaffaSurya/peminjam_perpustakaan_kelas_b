// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:peminjam_perpustakaan_kelas_b/app/modules/peminjaman/controllers/peminjaman_controller.dart';
// import '../../../routes/app_pages.dart';
//
// class PeminjamanView extends  GetView<PeminjamanController> {
//   const PeminjamanView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('History peminjaman Buku'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//             child: datakoleksibuku(),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 2, // Indeks halaman yang terpilih
//         onTap: (index) {
//           // Fungsi yang dipanggil ketika item bottom navigation bar ditekan
//           if (index == 0) {
//             // Jika item pertama ditekan, navigasi ke halaman home
//             Get.offAllNamed(Routes.HOME);
//           } else if (index == 1) {
//             // Jika item kedua ditekan, navigasi ke halaman pencarian
//             Get.toNamed(Routes.PENCARIAN);
//           } else if (index == 3) {
//             // Jika item ketiga ditekan, navigasi ke halaman History
//             Get.toNamed(Routes.KOLEKSI);
//           }
//         },
//         selectedItemColor: Colors.purple, // Warna ikon yang dipilih
//         unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home), // Ikon untuk item pertama
//             label: '', // Label untuk item pertama
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search), // Ikon untuk item kedua
//             label: '', // Label untuk item kedua
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.library_books), // Ikon untuk item ketiga
//             label: 'Peminjaman', // Label untuk item ketiga
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bookmark), // Ikon untuk item keempat
//             label: '', // Label untuk item keempat
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBookCard() {
//     return GestureDetector(
//       onTap: () {
//         // Implementasi logika untuk menavigasi ke detail buku
//       },
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.horizontal(
//                 left: Radius.circular(15),
//               ),
//               child: Image.network(
//                 'https://perpustakaan.kemendagri.go.id/opac/lib/minigalnano/createthumb.php?filename=images/docs/Sejarah_Dunia_yang_Disembunyikan.jpg.jpg&width=200', // URL gambar sampul buku
//                 fit: BoxFit.cover,
//                 height: 100,
//                 width: 80,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Judul B', // Judul buku
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Penulis Buku', // Penulis buku
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Tanggal Pinjam: 2022-04-01', // Tanggal pinjam
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               'Tanggal Kembali: 2022-04-10', // Tanggal kembali
//                               style: TextStyle(
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   Widget datakoleksibuku() {
//      return GetBuilder<PeminjamanController>(builder: (controller) {
//        if (controller.datakoleksibuku.isEmpty) {
//          return Center(
//            child: CircularProgressIndicator(
//              color: Colors.black,
//              backgroundColor: Colors.grey,
//              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFEA1818)),
//            ),
//          );
//        } else{
//          return SingleChildScrollView(
//            child: Column(
//              children: List.generate(controller.datakoleksibuku.length, (index) {
//                var History = controller.datakoleksibuku[index];
//                return InkWell(
//                  onTap: () {
//
//                  },
//                  child: Card(
//                    elevation: 3,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15),
//                    ),
//                    child: Row(
//                      children: [
//                        ClipRRect(
//                          borderRadius: BorderRadius.horizontal(
//                            left: Radius.circular(15),
//                          ),
//                          child: Image.network(
//                            History.coverBuku.toString(),
//                            fit: BoxFit.cover,
//                            height: 100,
//                            width: 80,
//                          ),
//                        ),
//                        Expanded(
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//                                Text(
//                                  History.judulBuku.toString(), // Judul buku
//                                  style: TextStyle(
//                                    fontWeight: FontWeight.bold,
//                                  ),
//                                  maxLines: 2,
//                                  overflow: TextOverflow.ellipsis,
//                                ),
//                                SizedBox(height: 4),
//                                Text(
//                                  History.kodePeminjaman.toString(), // Penulis buku
//                                  style: TextStyle(
//                                    color: Colors.grey,
//                                  ),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                );
//              }),
//            ),
//          );
//        }
//     });
//   }
// }

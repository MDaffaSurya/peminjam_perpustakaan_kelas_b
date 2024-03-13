import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/book/controllers/book_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/home/controllers/home_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:peminjam_perpustakaan_kelas_b/app/modules/peminjaman/controllers/peminjaman_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<BookController>(
          () => BookController(),
    );
    Get.lazyPut<PeminjamanController>(
          () => PeminjamanController(),
    );
    Get.lazyPut<KoleksiController>(
          () => KoleksiController(),
    );
  }
}

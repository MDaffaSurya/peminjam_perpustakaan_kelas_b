import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF5566FF);
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'), // Judul AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icon tombol back
          onPressed: () {
            Get.offAllNamed(Routes.HOME); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.050,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xFFF5F5F5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Icon(
                          Icons.account_circle, // Gunakan ikon pengguna bawaan Flutter
                          size: 100, // Sesuaikan ukuran ikon dengan preferensi Anda
                          color: Colors.grey, // Sesuaikan warna ikon dengan preferensi Anda
                        ),
                      ),
                      SizedBox(
                        height: height * 0.010,
                      ),
                      Text(
                        controller.usernameUser,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                      ,Text(
                        controller.idUser,
                        style: GoogleFonts.manrope(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.040,
          ),
          buildCustomButton(
            label: "History Peminjaman",
            onPressed: () {
              Get.toNamed(Routes.HISTORY_PINJAM);
            },
            backgroundColor: primary,
          ),
          SizedBox(
            height: height * 0.015,
          ),
          buildCustomButton(
            label: "Logout Akun",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Konfirmasi Logout"),
                    content: Text("Apakah Anda yakin untuk logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();// Logout jika dikonfirmasi// Tutup dialog jika tidak jadi logout
                        },
                        child: Text("Tidak"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();// Logout jika dikonfirmasi// Tutup dialog jika tidak jadi logout
                          Get.offAllNamed(Routes.LOGIN);
                        },
                        child: Text("Ya"),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color(0xFFB53333),
          ),

          SizedBox(
            height: height * 0.015,
          ),

          buildCustomButton(
            label: "Edit Profile",
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Konfirmasi Edit Profile"),
                    content: Text("Apakah Anda yakin untuk Edit Profile?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();// Logout jika dikonfirmasi// Tutup dialog jika tidak jadi logout
                        },
                        child: Text("Tidak"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();// Logout jika dikonfirmasi// Tutup dialog jika tidak jadi logout
                          Get.toNamed(Routes.UPDATE_PROFILE);
                        },
                        child: Text("Ya"),
                      ),
                    ],
                  );
                },
              );
            },
            backgroundColor: const Color(0xFF351A96),
          ),
        ],
      ),
    );
  }

  Widget buildCustomButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

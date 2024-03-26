import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAllNamed(Routes.LOGIN);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_image.png'), // Ganti dengan gambar profil Anda
              ),
              SizedBox(height: 20), // Mengatur jarak tinggi sebesar 20
              Text(
                'Nama Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5), // Mengatur jarak tinggi sebesar 5
              Text(
                'nama_pengguna', // Ganti dengan nama pengguna Anda
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10), // Mengatur jarak tinggi sebesar 10
              Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5), // Mengatur jarak tinggi sebesar 5
              Text(
                'email@example.com', // Ganti dengan alamat email Anda
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10), // Mengatur jarak tinggi sebesar 10
              ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi untuk mengedit profil
                },
                child: Text('Edit Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

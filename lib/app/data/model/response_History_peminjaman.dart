/// status : 200
/// message : "Berhasil Menampilkan All Peminjaman"
/// data : [{"PeminjamanID":11,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/","kode_peminjaman":"2024WZC171","status":"Dipinjam","username":"ronaldo","email":"ronaldo@smk.belajar.id","tanggal_pinjam":"2024-04-17","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-24","judul_buku":"Sejarah perang dunia 1","penulis_buku":"Alfi Arifian","penerbit_buku":"Gramedia","tahun_buku":"2020"},{"PeminjamanID":14,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/","kode_peminjaman":"20242TW181","status":"Dipinjam","username":"ronaldo","email":"ronaldo@smk.belajar.id","tanggal_pinjam":"2024-04-18","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-25","judul_buku":"Brianna dan Bottomwise","penulis_buku":"Andrea Hirata","penerbit_buku":"Gramedia","tahun_buku":"2011"},{"PeminjamanID":15,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/","kode_peminjaman":"2024LDL181","status":"Dipinjam","username":"ronaldo","email":"ronaldo@smk.belajar.id","tanggal_pinjam":"2024-04-18","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-25","judul_buku":"Nyanyian Achilles","penulis_buku":"Madeline Miller","penerbit_buku":"Gramedia","tahun_buku":"2022"},{"PeminjamanID":16,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/","kode_peminjaman":"2024PBU181","status":"Dipinjam","username":"ronaldo","email":"ronaldo@smk.belajar.id","tanggal_pinjam":"2024-04-18","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-25","judul_buku":"Sejarah prancis","penulis_buku":"Surya","penerbit_buku":"Smk 5","tahun_buku":"2010"}]

class ResponseHistoryPeminjaman {
  ResponseHistoryPeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponseHistoryPeminjaman.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataHistoryPeminjaman.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataHistoryPeminjaman>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// PeminjamanID : 11
/// CoverBuku : "http://127.0.0.1:8000/storage/images/coverbook/"
/// kode_peminjaman : "2024WZC171"
/// status : "Dipinjam"
/// username : "ronaldo"
/// email : "ronaldo@smk.belajar.id"
/// tanggal_pinjam : "2024-04-17"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-24"
/// judul_buku : "Sejarah perang dunia 1"
/// penulis_buku : "Alfi Arifian"
/// penerbit_buku : "Gramedia"
/// tahun_buku : "2020"

class DataHistoryPeminjaman {
  DataHistoryPeminjaman({
      this.peminjamanID, 
      this.coverBuku, 
      this.kodePeminjaman, 
      this.status, 
      this.username, 
      this.email, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline, 
      this.judulBuku, 
      this.penulisBuku, 
      this.penerbitBuku, 
      this.tahunBuku,});

  DataHistoryPeminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    coverBuku = json['CoverBuku'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    username = json['username'];
    email = json['email'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
    judulBuku = json['judul_buku'];
    penulisBuku = json['penulis_buku'];
    penerbitBuku = json['penerbit_buku'];
    tahunBuku = json['tahun_buku'];
  }
  int? peminjamanID;
  String? coverBuku;
  String? kodePeminjaman;
  String? status;
  String? username;
  String? email;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;
  String? judulBuku;
  String? penulisBuku;
  String? penerbitBuku;
  String? tahunBuku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['CoverBuku'] = coverBuku;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['username'] = username;
    map['email'] = email;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    map['judul_buku'] = judulBuku;
    map['penulis_buku'] = penulisBuku;
    map['penerbit_buku'] = penerbitBuku;
    map['tahun_buku'] = tahunBuku;
    return map;
  }

}
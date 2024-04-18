/// Status : 200
/// Message : "Berhasil Menambahkan Peminjaman"
/// Addpeminjaman : {"PeminjamanID":7,"kode_peminjaman":"2024RSK174","status":"Dipinjam","tanggal_pinjam":"2024-04-17","tanggal_kembali":"Belum dikembalikan","Deadline":"2024-04-24"}

class ResponseAddPeminjaman {
  ResponseAddPeminjaman({
      this.status, 
      this.message, 
      this.data,});

  ResponseAddPeminjaman.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Addpeminjaman'] != null ? Addpeminjaman.fromJson(json['Addpeminjaman']) : null;
  }
  int? status;
  String? message;
  Addpeminjaman? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['Addpeminjaman'] = data?.toJson();
    }
    return map;
  }

}

/// PeminjamanID : 7
/// kode_peminjaman : "2024RSK174"
/// status : "Dipinjam"
/// tanggal_pinjam : "2024-04-17"
/// tanggal_kembali : "Belum dikembalikan"
/// Deadline : "2024-04-24"

class Addpeminjaman {
  Addpeminjaman({
      this.peminjamanID, 
      this.kodePeminjaman, 
      this.status, 
      this.tanggalPinjam, 
      this.tanggalKembali, 
      this.deadline,});

  Addpeminjaman.fromJson(dynamic json) {
    peminjamanID = json['PeminjamanID'];
    kodePeminjaman = json['kode_peminjaman'];
    status = json['status'];
    tanggalPinjam = json['tanggal_pinjam'];
    tanggalKembali = json['tanggal_kembali'];
    deadline = json['Deadline'];
  }
  int? peminjamanID;
  String? kodePeminjaman;
  String? status;
  String? tanggalPinjam;
  String? tanggalKembali;
  String? deadline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PeminjamanID'] = peminjamanID;
    map['kode_peminjaman'] = kodePeminjaman;
    map['status'] = status;
    map['tanggal_pinjam'] = tanggalPinjam;
    map['tanggal_kembali'] = tanggalKembali;
    map['Deadline'] = deadline;
    return map;
  }

}
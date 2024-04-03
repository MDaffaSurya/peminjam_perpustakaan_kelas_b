/// Status : 200
/// Message : "Berhasil Get Koleksi"
/// data : [{"BukuID":1,"CoverBuku":"Sejarah Dunia.jpg","Judul":"Sejarah Dunia","Penulis":"Surya","Penerbit":"Smk 5","TahunTerbit":"2010","JumlahHalaman":"30","Rating":3.8,"Total_ulasan":5,"JumlahRating":19,"JumlahPeminjam":2,"Kategori":["Sejarah","Novel"]},{"BukuID":5,"CoverBuku":"filosofi futsal.jpg","Judul":"filosofi futsal","Penulis":"Justinus Lhaksana","Penerbit":"Fc Barcelona","TahunTerbit":"2010","JumlahHalaman":"82","Rating":3,"Total_ulasan":4,"JumlahRating":12,"JumlahPeminjam":0,"Kategori":["Olahraga"]},{"BukuID":9,"CoverBuku":"Nyanyian Achilles.jpg","Judul":"Nyanyian Achilles","Penulis":"Madeline Miller","Penerbit":"Gramedia","TahunTerbit":"2022","JumlahHalaman":"488","Rating":3.5,"Total_ulasan":4,"JumlahRating":14,"JumlahPeminjam":0,"Kategori":["Novel","Fiksi"]}]

class ResponseKoleksi {
  ResponseKoleksi({
      this.status, 
      this.message, 
      this.data,});

  ResponseKoleksi.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKoleksi.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataKoleksi>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 1
/// CoverBuku : "Sejarah Dunia.jpg"
/// Judul : "Sejarah Dunia"
/// Penulis : "Surya"
/// Penerbit : "Smk 5"
/// TahunTerbit : "2010"
/// JumlahHalaman : "30"
/// Rating : 3.8
/// Total_ulasan : 5
/// JumlahRating : 19
/// JumlahPeminjam : 2
/// Kategori : ["Sejarah","Novel"]

class DataKoleksi {
  DataKoleksi({
      this.bukuID, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.kategori,});

  DataKoleksi.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating'];
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
  }
  int? bukuID;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  List<String>? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['CoverBuku'] = coverBuku;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['JumlahHalaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Kategori'] = kategori;
    return map;
  }

}
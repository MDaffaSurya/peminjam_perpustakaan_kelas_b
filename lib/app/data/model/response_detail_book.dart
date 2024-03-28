/// Status : 200
/// Message : "Berhasil Menampilkan Detail Buku"
/// data : {"Buku":{"BukuID":1,"Deskripsi":"Sejarah dunia adalah sejarah umat manusia di seluruh dunia, semua daerah di Bumi, dirunut dari era Paleolitikum (zaman batu tua). Berbeda dengan sejarah Bumi (yang mencakup sejarah geologis Bumi dan era sebelum keberadaan manusia), sejarah dunia terdiri dari kajian rekam arkeologi dan catatan tertulis, dari zaman kuno hingga saat ini.","CoverBuku":"Sejarah Dunia.jpg","Judul":"Sejarah Dunia","Penulis":"Surya","Penerbit":"Smk 5","TahunTerbit":"2010","JumlahHalaman":"30","Rating":4,"Total_ulasan":2,"JumlahRating":8,"JumlahPeminjam":0},"Kategori":["Sejarah","Novel"],"Ulasan":[{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Bagus sekali","Rating":5,"created_at":"2024-03-14T07:13:36.000000Z","updated_at":"2024-03-14T07:13:36.000000Z","users":{"id":1,"Username":"ronaldo","Email":"ronaldo@smk.belajar.id","Password":"$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK","Level":"User","created_at":"2024-03-14T06:01:26.000000Z","updated_at":"2024-03-14T06:01:26.000000Z"}},{"UlasanID":2,"UserID":1,"BukuID":1,"Ulasan":"Bagus sekali","Rating":3,"created_at":"2024-03-14T07:16:08.000000Z","updated_at":"2024-03-14T07:16:08.000000Z","users":{"id":1,"Username":"ronaldo","Email":"ronaldo@smk.belajar.id","Password":"$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK","Level":"User","created_at":"2024-03-14T06:01:26.000000Z","updated_at":"2024-03-14T06:01:26.000000Z"}}]}

class ResponseDetailBook {
  ResponseDetailBook({
    this.status,
    this.message,
    this.data,});

  ResponseDetailBook.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? Datadetailbook.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  Datadetailbook? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// Buku : {"BukuID":1,"Deskripsi":"Sejarah dunia adalah sejarah umat manusia di seluruh dunia, semua daerah di Bumi, dirunut dari era Paleolitikum (zaman batu tua). Berbeda dengan sejarah Bumi (yang mencakup sejarah geologis Bumi dan era sebelum keberadaan manusia), sejarah dunia terdiri dari kajian rekam arkeologi dan catatan tertulis, dari zaman kuno hingga saat ini.","CoverBuku":"Sejarah Dunia.jpg","Judul":"Sejarah Dunia","Penulis":"Surya","Penerbit":"Smk 5","TahunTerbit":"2010","JumlahHalaman":"30","Rating":4,"Total_ulasan":2,"JumlahRating":8,"JumlahPeminjam":0}
/// Kategori : ["Sejarah","Novel"]
/// Ulasan : [{"UlasanID":1,"UserID":1,"BukuID":1,"Ulasan":"Bagus sekali","Rating":5,"created_at":"2024-03-14T07:13:36.000000Z","updated_at":"2024-03-14T07:13:36.000000Z","users":{"id":1,"Username":"ronaldo","Email":"ronaldo@smk.belajar.id","Password":"$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK","Level":"User","created_at":"2024-03-14T06:01:26.000000Z","updated_at":"2024-03-14T06:01:26.000000Z"}},{"UlasanID":2,"UserID":1,"BukuID":1,"Ulasan":"Bagus sekali","Rating":3,"created_at":"2024-03-14T07:16:08.000000Z","updated_at":"2024-03-14T07:16:08.000000Z","users":{"id":1,"Username":"ronaldo","Email":"ronaldo@smk.belajar.id","Password":"$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK","Level":"User","created_at":"2024-03-14T06:01:26.000000Z","updated_at":"2024-03-14T06:01:26.000000Z"}}]

class Datadetailbook {
  Datadetailbook({
    this.buku,
    this.kategori,
    this.ulasan,});

  Datadetailbook.fromJson(dynamic json) {
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
    if (json['Ulasan'] != null) {
      ulasan = [];
      json['Ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
  }
  Buku? buku;
  List<String>? kategori;
  List<Ulasan>? ulasan;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    map['Kategori'] = kategori;
    if (ulasan != null) {
      map['Ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UlasanID : 1
/// UserID : 1
/// BukuID : 1
/// Ulasan : "Bagus sekali"
/// Rating : 5
/// created_at : "2024-03-14T07:13:36.000000Z"
/// updated_at : "2024-03-14T07:13:36.000000Z"
/// users : {"id":1,"Username":"ronaldo","Email":"ronaldo@smk.belajar.id","Password":"$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK","Level":"User","created_at":"2024-03-14T06:01:26.000000Z","updated_at":"2024-03-14T06:01:26.000000Z"}

class Ulasan {
  Ulasan({
    this.ulasanID,
    this.userID,
    this.bukuID,
    this.ulasan,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.users,});

  Ulasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bukuID = json['BukuID'];
    ulasan = json['Ulasan'];
    rating = json['Rating']?.toDouble();
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
  int? ulasanID;
  int? userID;
  int? bukuID;
  String? ulasan;
  double? rating;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BukuID'] = bukuID;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (users != null) {
      map['users'] = users?.toJson();
    }
    return map;
  }

}

/// id : 1
/// Username : "ronaldo"
/// Email : "ronaldo@smk.belajar.id"
/// Password : "$2y$12$1BUJ39YCjEXA.0TiCn2g5OEninjfreB.WjGTlwfrcSLkSjGntV6gK"
/// Level : "User"
/// created_at : "2024-03-14T06:01:26.000000Z"
/// updated_at : "2024-03-14T06:01:26.000000Z"

class Users {
  Users({
    this.id,
    this.username,
    this.email,
    this.password,
    this.level,
    this.createdAt,
    this.updatedAt,});

  Users.fromJson(dynamic json) {
    id = json['id'];
    username = json['Username'];
    email = json['Email'];
    password = json['Password'];
    level = json['Level'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? username;
  String? email;
  String? password;
  String? level;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['Username'] = username;
    map['Email'] = email;
    map['Password'] = password;
    map['Level'] = level;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// BukuID : 1
/// Deskripsi : "Sejarah dunia adalah sejarah umat manusia di seluruh dunia, semua daerah di Bumi, dirunut dari era Paleolitikum (zaman batu tua). Berbeda dengan sejarah Bumi (yang mencakup sejarah geologis Bumi dan era sebelum keberadaan manusia), sejarah dunia terdiri dari kajian rekam arkeologi dan catatan tertulis, dari zaman kuno hingga saat ini."
/// CoverBuku : "Sejarah Dunia.jpg"
/// Judul : "Sejarah Dunia"
/// Penulis : "Surya"
/// Penerbit : "Smk 5"
/// TahunTerbit : "2010"
/// JumlahHalaman : "30"
/// Rating : 4
/// Total_ulasan : 2
/// JumlahRating : 8
/// JumlahPeminjam : 0

class Buku {
  Buku({
    this.bukuID,
    this.deskripsi,
    this.coverBuku,
    this.judul,
    this.penulis,
    this.penerbit,
    this.tahunTerbit,
    this.jumlahHalaman,
    this.rating,
    this.totalUlasan,
    this.jumlahRating,
    this.jumlahPeminjam,});

  Buku.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    deskripsi = json['Deskripsi'];
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
  }
  int? bukuID;
  String? deskripsi;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  double? jumlahRating;
  int? jumlahPeminjam;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['Deskripsi'] = deskripsi;
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
    return map;
  }

}
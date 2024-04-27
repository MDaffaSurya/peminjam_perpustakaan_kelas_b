/// Status : 201
/// Message : "Berhasil Menampilkan update Profil"
/// data : {"id":11,"username":"dedy","email":"dedy@smk.belajar.id","Level":"User"}

class ResponseUpdateProfile {
  ResponseUpdateProfile({
      this.status,
      this.message,
      this.data,});

  ResponseUpdateProfile.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    data = json['data'] != null ? DataUpdateProfile.fromJson(json['data']) : null;
  }
  int? status;
  String? message;
  DataUpdateProfile? data;

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

/// id : 11
/// username : "dedy"
/// email : "dedy@smk.belajar.id"
/// Level : "User"

class DataUpdateProfile {
  DataUpdateProfile({
      this.id,
      this.username,
      this.email,
      this.level,
      this.password,});

  DataUpdateProfile.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    level = json['Level'];
  }
  int? id;
  String? username;
  String? email;
  String? level;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['Level'] = level;
    map['Password'] = password;
    return map;
  }

}
// To parse this JSON data, do
//
//     final userPhoto = userPhotoFromJson(jsonString);

import 'dart:convert';

UserPhoto userPhotoFromJson(String str) => UserPhoto.fromJson(json.decode(str));

String userPhotoToJson(UserPhoto data) => json.encode(data.toJson());

class UserPhoto {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? downloadUrl;

  UserPhoto({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  factory UserPhoto.fromJson(Map<String, dynamic> json) => UserPhoto(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
      };
}

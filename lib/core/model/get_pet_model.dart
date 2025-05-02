// To parse this JSON data, do
//
//     final getPetResponse = getPetResponseFromJson(jsonString);

import 'dart:convert';

GetPetResponse getPetResponseFromJson(String str) =>
    GetPetResponse.fromJson(json.decode(str));

String getPetResponseToJson(GetPetResponse data) => json.encode(data.toJson());

class GetPetResponse {
  int status;
  List<Datum> data;

  GetPetResponse({
    required this.status,
    required this.data,
  });

  factory GetPetResponse.fromJson(Map<String, dynamic> json) => GetPetResponse(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String userName;
  String petName;
  String petType;
  String gender;
  String location;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  String imageUrl;

  Datum({
    required this.id,
    required this.userName,
    required this.petName,
    required this.petType,
    required this.gender,
    required this.location,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userName: json["user_name"],
        petName: json["pet_name"],
        petType: json["pet_type"],
        gender: json["gender"],
        location: json["location"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "pet_name": petName,
        "pet_type": petType,
        "gender": gender,
        "location": location,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image_url": imageUrl,
      };
}

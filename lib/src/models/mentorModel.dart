// To parse this JSON data, do
//
//     final mentorModel = mentorModelFromJson(jsonString);

import 'dart:convert';

List<MentorModel> mentorModelFromJson(String str) => List<MentorModel>.from(json.decode(str).map((x) => MentorModel.fromJson(x)));
MentorModel mentorObjectModelFromJson(String str) => MentorModel.fromJson(json.decode(str));

String mentorModelToJson(List<MentorModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MentorModel {
  dynamic idUserDetails;
  String idUserProfile;
  String name;
  String username;
  String email;
  String contact;
  String address;
  String userType;
  String coachTitle;
  String profession;
  dynamic mottoTagline;
  String aboutMe;
  String imageUrl;
  String imageUrlThumbnail;
  dynamic gender;
  dynamic dateOfBirth;
  String urlPlaceholder;
  String urlPlaceholderThumbnail;

  MentorModel({
    this.idUserDetails,
    this.idUserProfile,
    this.name,
    this.username,
    this.email,
    this.contact,
    this.address,
    this.userType,
    this.coachTitle,
    this.profession,
    this.mottoTagline,
    this.aboutMe,
    this.imageUrl,
    this.imageUrlThumbnail,
    this.gender,
    this.dateOfBirth,
    this.urlPlaceholder,
    this.urlPlaceholderThumbnail,
  });

  factory MentorModel.fromJson(Map<String, dynamic> json) => MentorModel(
    idUserDetails: json["idUserDetails"],
    idUserProfile: json["idUserProfile"] == null ? null : json["idUserProfile"],
    name: json["name"] == null ? null : json["name"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    contact: json["contact"] == null ? null : json["contact"],
    address: json["address"] == null ? null : json["address"],
    userType: json["userType"] == null ? null : json["userType"],
    coachTitle: json["coachTitle"] == null ? null : json["coachTitle"],
    profession: json["profession"] == null ? null : json["profession"],
    mottoTagline: json["mottoTagline"],
    aboutMe: json["aboutMe"] == null ? null : json["aboutMe"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
    imageUrlThumbnail: json["imageUrlThumbnail"] == null ? null : json["imageUrlThumbnail"],
    gender: json["gender"],
    dateOfBirth: json["dateOfBirth"],
    urlPlaceholder: json["urlPlaceholder"] == null ? null : json["urlPlaceholder"],
    urlPlaceholderThumbnail: json["urlPlaceholderThumbnail"] == null ? null : json["urlPlaceholderThumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "idUserDetails": idUserDetails,
    "idUserProfile": idUserProfile == null ? null : idUserProfile,
    "name": name == null ? null : name,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "contact": contact == null ? null : contact,
    "address": address == null ? null : address,
    "userType": userType == null ? null : userType,
    "coachTitle": coachTitle == null ? null : coachTitle,
    "profession": profession == null ? null : profession,
    "mottoTagline": mottoTagline,
    "aboutMe": aboutMe == null ? null : aboutMe,
    "imageUrl": imageUrl == null ? null : imageUrl,
    "imageUrlThumbnail": imageUrlThumbnail == null ? null : imageUrlThumbnail,
    "gender": gender,
    "dateOfBirth": dateOfBirth,
    "urlPlaceholder": urlPlaceholder == null ? null : urlPlaceholder,
    "urlPlaceholderThumbnail": urlPlaceholderThumbnail == null ? null : urlPlaceholderThumbnail,
  };
}

// To parse this JSON data, do
//
//     final materiModel = materiModelFromJson(jsonString);

import 'dart:convert';

List<MateriModel> materiModelFromJson(String str) => List<MateriModel>.from(json.decode(str).map((x) => MateriModel.fromJson(x)));

String materiModelToJson(List<MateriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MateriModel {
  String id;
  String idCourse;
  String resourceType;
  String urlType;
  String urlContent;
  String urlThumbnail;
  dynamic publicId;
  String title;
  dynamic description;
  bool lockContent;
  dynamic formatFile;
  dynamic createdBy;
  dynamic createdDate;
  dynamic updatedBy;
  dynamic updatedDate;

  MateriModel({
    this.id,
    this.idCourse,
    this.resourceType,
    this.urlType,
    this.urlContent,
    this.urlThumbnail,
    this.publicId,
    this.title,
    this.description,
    this.lockContent,
    this.formatFile,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory MateriModel.fromJson(Map<String, dynamic> json) => MateriModel(
    id: json["id"] == null ? null : json["id"],
    idCourse: json["idCourse"] == null ? null : json["idCourse"],
    resourceType: json["resourceType"] == null ? null : json["resourceType"],
    urlType: json["urlType"] == null ? null : json["urlType"],
    urlContent: json["urlContent"] == null ? null : json["urlContent"],
    urlThumbnail: json["urlThumbnail"] == null ? null : json["urlThumbnail"],
    publicId: json["publicId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"],
    lockContent: json["lockContent"] == null ? null : json["lockContent"],
    formatFile: json["formatFile"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"],
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "idCourse": idCourse == null ? null : idCourse,
    "resourceType": resourceType == null ? null : resourceType,
    "urlType": urlType == null ? null : urlType,
    "urlContent": urlContent == null ? null : urlContent,
    "urlThumbnail": urlThumbnail == null ? null : urlThumbnail,
    "publicId": publicId,
    "title": title == null ? null : title,
    "description": description,
    "lockContent": lockContent == null ? null : lockContent,
    "formatFile": formatFile,
    "createdBy": createdBy,
    "createdDate": createdDate,
    "updatedBy": updatedBy,
    "updatedDate": updatedDate,
  };
}

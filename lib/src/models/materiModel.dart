// To parse this JSON data, do
//
//     final materiModel = materiModelFromJson(jsonString);

import 'dart:convert';

List<MateriModel> materiModelFromJson(String str) => List<MateriModel>.from(json.decode(str).map((x) => MateriModel.fromJson(x)));

String materiModelToJson(List<MateriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MateriModel {
  String id;
  String idCourses;
  String materiTitle;
  dynamic materiDescription;
  List<ListContentMateri> listContentMateri;

  MateriModel({
    this.id,
    this.idCourses,
    this.materiTitle,
    this.materiDescription,
    this.listContentMateri,
  });

  factory MateriModel.fromJson(Map<String, dynamic> json) => MateriModel(
    id: json["id"] == null ? null : json["id"],
    idCourses: json["idCourses"] == null ? null : json["idCourses"],
    materiTitle: json["materiTitle"] == null ? null : json["materiTitle"],
    materiDescription: json["materiDescription"],
    listContentMateri: json["listContentMateri"] == null ? null : List<ListContentMateri>.from(json["listContentMateri"].map((x) => ListContentMateri.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "idCourses": idCourses == null ? null : idCourses,
    "materiTitle": materiTitle == null ? null : materiTitle,
    "materiDescription": materiDescription,
    "listContentMateri": listContentMateri == null ? null : List<dynamic>.from(listContentMateri.map((x) => x.toJson())),
  };
}

class ListContentMateri {
  String idFile;
  String idCourse;
  String idMateri;
  String resourcetype;
  String urlType;
  String url;
  String urlThumbnail;
  dynamic publicId;
  dynamic formatFile;
  String createdBy;
  String createdDate;
  dynamic updatedBy;
  String updatedDate;

  ListContentMateri({
    this.idFile,
    this.idCourse,
    this.idMateri,
    this.resourcetype,
    this.urlType,
    this.url,
    this.urlThumbnail,
    this.publicId,
    this.formatFile,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  factory ListContentMateri.fromJson(Map<String, dynamic> json) => ListContentMateri(
    idFile: json["idFile"] == null ? null : json["idFile"],
    idCourse: json["idCourse"] == null ? null : json["idCourse"],
    idMateri: json["idMateri"] == null ? null : json["idMateri"],
    resourcetype: json["resourcetype"] == null ? null : json["resourcetype"],
    urlType: json["urlType"] == null ? null : json["urlType"],
    url: json["url"] == null ? null : json["url"],
    urlThumbnail: json["urlThumbnail"] == null ? null : json["urlThumbnail"],
    publicId: json["publicId"],
    formatFile: json["formatFile"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    createdDate: json["createdDate"] == null ? null : json["createdDate"],
    updatedBy: json["updatedBy"],
    updatedDate: json["updatedDate"] == null ? null : json["updatedDate"],
  );

  Map<String, dynamic> toJson() => {
    "idFile": idFile == null ? null : idFile,
    "idCourse": idCourse == null ? null : idCourse,
    "idMateri": idMateri == null ? null : idMateri,
    "resourcetype": resourcetype == null ? null : resourcetype,
    "urlType": urlType == null ? null : urlType,
    "url": url == null ? null : url,
    "urlThumbnail": urlThumbnail == null ? null : urlThumbnail,
    "publicId": publicId,
    "formatFile": formatFile,
    "createdBy": createdBy == null ? null : createdBy,
    "createdDate": createdDate == null ? null : createdDate,
    "updatedBy": updatedBy,
    "updatedDate": updatedDate == null ? null : updatedDate,
  };
}

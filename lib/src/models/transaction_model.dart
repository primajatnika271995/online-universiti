// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

List<TransactionModel> transactionModelFromJson(String str) => List<TransactionModel>.from(json.decode(str).map((x) => TransactionModel.fromJson(x)));

String transactionModelToJson(List<TransactionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransactionModel {
  String idCourse;
  String courseTitle;
  dynamic coursePrice;
  String mentorName;
  String mentorTitle;
  String mentorProfileUrl;
  double rating;
  String bannerCourseUrl;
  String bannerTypeFile;
  String idCategoryCourse;
  String categoryCourseTitle;
  String namaBank;
  String noRekening;
  String pemilikRekeningName;
  String status;
  String statusName;
  String statusColor;

  TransactionModel({
    this.idCourse,
    this.courseTitle,
    this.coursePrice,
    this.mentorName,
    this.mentorTitle,
    this.mentorProfileUrl,
    this.rating,
    this.bannerCourseUrl,
    this.bannerTypeFile,
    this.idCategoryCourse,
    this.categoryCourseTitle,
    this.namaBank,
    this.noRekening,
    this.pemilikRekeningName,
    this.status,
    this.statusName,
    this.statusColor,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    idCourse: json["idCourse"] == null ? null : json["idCourse"],
    courseTitle: json["courseTitle"] == null ? null : json["courseTitle"],
    coursePrice: json["coursePrice"] == null ? null : json["coursePrice"],
    mentorName: json["mentorName"] == null ? null : json["mentorName"],
    mentorTitle: json["mentorTitle"] == null ? null : json["mentorTitle"],
    mentorProfileUrl: json["mentorProfileUrl"] == null ? null : json["mentorProfileUrl"],
    rating: json["rating"] == null ? null : json["rating"],
    bannerCourseUrl: json["bannerCourseUrl"] == null ? null : json["bannerCourseUrl"],
    bannerTypeFile: json["bannerTypeFile"] == null ? null : json["bannerTypeFile"],
    idCategoryCourse: json["idCategoryCourse"] == null ? null : json["idCategoryCourse"],
    categoryCourseTitle: json["categoryCourseTitle"] == null ? null : json["categoryCourseTitle"],
    namaBank: json["namaBank"] == null ? null : json["namaBank"],
    noRekening: json["noRekening"] == null ? null : json["noRekening"],
    pemilikRekeningName: json["pemilikRekeningName"] == null ? null : json["pemilikRekeningName"],
    status: json["status"] == null ? null : json["status"],
    statusName: json["statusName"] == null ? null : json["statusName"],
    statusColor: json["statusColor"] == null ? null : json["statusColor"],
  );

  Map<String, dynamic> toJson() => {
    "idCourse": idCourse == null ? null : idCourse,
    "courseTitle": courseTitle == null ? null : courseTitle,
    "coursePrice": coursePrice == null ? null : coursePrice,
    "mentorName": mentorName == null ? null : mentorName,
    "mentorTitle": mentorTitle == null ? null : mentorTitle,
    "mentorProfileUrl": mentorProfileUrl == null ? null : mentorProfileUrl,
    "rating": rating == null ? null : rating,
    "bannerCourseUrl": bannerCourseUrl == null ? null : bannerCourseUrl,
    "bannerTypeFile": bannerTypeFile == null ? null : bannerTypeFile,
    "idCategoryCourse": idCategoryCourse == null ? null : idCategoryCourse,
    "categoryCourseTitle": categoryCourseTitle == null ? null : categoryCourseTitle,
    "namaBank": namaBank == null ? null : namaBank,
    "noRekening": noRekening == null ? null : noRekening,
    "pemilikRekeningName": pemilikRekeningName == null ? null : pemilikRekeningName,
    "status": status == null ? null : status,
    "statusName": statusName == null ? null : statusName,
    "statusColor": statusColor == null ? null : statusColor,
  };
}

// To parse this JSON data, do
//
//     final bisnisKreatifModel = bisnisKreatifModelFromJson(jsonString);

import 'dart:convert';

List<BisnisKreatifModel> bisnisKreatifModelFromJson(String str) => List<BisnisKreatifModel>.from(json.decode(str).map((x) => BisnisKreatifModel.fromJson(x)));

String bisnisKreatifModelToJson(List<BisnisKreatifModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BisnisKreatifModel {
  String idCourse;
  String courseTitle;
  dynamic coursePrice;
  String mentorName;
  String mentorTitle;
  String mentorProfileUrl;
  dynamic rating;
  String bannerCourseUrl;
  String bannerTypeFile;
  String idCategoryCourse;
  String categoryCourseTitle;

  BisnisKreatifModel({
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
  });

  factory BisnisKreatifModel.fromJson(Map<String, dynamic> json) => BisnisKreatifModel(
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
  };
}

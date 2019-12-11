// To parse this JSON data, do
//
//     final mentorModel = mentorModelFromJson(jsonString);

import 'dart:convert';

List<CourseModel> courseModelFromJson(String str) => List<CourseModel>.from(json.decode(str).map((x) => CourseModel.fromJson(x)));

String courseModelToJson(List<CourseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CourseModel {
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

  CourseModel({
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

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
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

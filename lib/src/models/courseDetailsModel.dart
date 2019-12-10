// To parse this JSON data, do
//
//     final courseDetailsModel = courseDetailsModelFromJson(jsonString);

import 'dart:convert';

CourseDetailsModel courseDetailsModelFromJson(String str) => CourseDetailsModel.fromJson(json.decode(str));

String courseDetailsModelToJson(CourseDetailsModel data) => json.encode(data.toJson());

class CourseDetailsModel {
  String idCourse;
  String courseTitle;
  String courseDescription;
  dynamic coursePrice;
  dynamic coursePriceDiscount;
  int totalMateri;
  String mentorName;
  String mentorTitle;
  String mentorProfileUrl;
  dynamic rating;
  String bannerCourseUrl;
  String bannerTypeFile;
  dynamic bannerFormatFile;
  dynamic urlPlaceholder;
  dynamic titlePlaceholder;

  CourseDetailsModel({
    this.idCourse,
    this.courseTitle,
    this.courseDescription,
    this.coursePrice,
    this.coursePriceDiscount,
    this.totalMateri,
    this.mentorName,
    this.mentorTitle,
    this.mentorProfileUrl,
    this.rating,
    this.bannerCourseUrl,
    this.bannerTypeFile,
    this.bannerFormatFile,
    this.urlPlaceholder,
    this.titlePlaceholder,
  });

  factory CourseDetailsModel.fromJson(Map<String, dynamic> json) => CourseDetailsModel(
    idCourse: json["idCourse"] == null ? null : json["idCourse"],
    courseTitle: json["courseTitle"] == null ? null : json["courseTitle"],
    courseDescription: json["courseDescription"] == null ? null : json["courseDescription"],
    coursePrice: json["coursePrice"] == null ? null : json["coursePrice"],
    coursePriceDiscount: json["coursePriceDiscount"],
    totalMateri: json["totalMateri"] == null ? null : json["totalMateri"],
    mentorName: json["mentorName"] == null ? null : json["mentorName"],
    mentorTitle: json["mentorTitle"] == null ? null : json["mentorTitle"],
    mentorProfileUrl: json["mentorProfileUrl"] == null ? null : json["mentorProfileUrl"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    bannerCourseUrl: json["bannerCourseUrl"] == null ? null : json["bannerCourseUrl"],
    bannerTypeFile: json["bannerTypeFile"] == null ? null : json["bannerTypeFile"],
    bannerFormatFile: json["bannerFormatFile"],
    urlPlaceholder: json["urlPlaceholder"],
    titlePlaceholder: json["titlePlaceholder"],
  );

  Map<String, dynamic> toJson() => {
    "idCourse": idCourse == null ? null : idCourse,
    "courseTitle": courseTitle == null ? null : courseTitle,
    "courseDescription": courseDescription == null ? null : courseDescription,
    "coursePrice": coursePrice == null ? null : coursePrice,
    "coursePriceDiscount": coursePriceDiscount,
    "totalMateri": totalMateri == null ? null : totalMateri,
    "mentorName": mentorName == null ? null : mentorName,
    "mentorTitle": mentorTitle == null ? null : mentorTitle,
    "mentorProfileUrl": mentorProfileUrl == null ? null : mentorProfileUrl,
    "rating": rating == null ? null : rating,
    "bannerCourseUrl": bannerCourseUrl == null ? null : bannerCourseUrl,
    "bannerTypeFile": bannerTypeFile == null ? null : bannerTypeFile,
    "bannerFormatFile": bannerFormatFile,
    "urlPlaceholder": urlPlaceholder,
    "titlePlaceholder": titlePlaceholder,
  };
}

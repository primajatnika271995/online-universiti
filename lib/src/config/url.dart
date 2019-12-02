class UriApi {
  UriApi._();

  static const String _authUri = "http://116.206.196.170/online-university-auth-server";

  // Login Api
  static const String loginUri = _authUri + "/oauth/token";

  // Get List Mentor
  static const String getListMentorUri = _authUri + "/api/public/profile/mentor/list";
  // Get Mentor by ID User Profile
  static const String getMentorByID = _authUri + "/api/public/profile/mentor/by-id-profile";

  // Get Data Tabs Bisnis Kreatif / Keterampilan Kreatif
  static const String getListDataTabs = _authUri + "/api/public/courses/list";
  // Get Details Course Bisnis Kreatif dan Keterampilan Kreatif
  static const String getDetailsCourseTabs = _authUri + "/api/public/courses/";

  // Get Data Course by ID Mentor
  static const String getListCourseByIDMentor = _authUri + "/api/public/courses/list/by-mentor-profile";
}

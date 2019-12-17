class UriApi {
  UriApi._();

  static const String dioAuthUri = "http://116.206.196.170/online-university-auth-server";

  // Login Api
  static const String loginUri = "/oauth/token";

  // Get List Mentor
  static const String getListMentorUri = "/api/public/profile/mentor/list";

  // Get Mentor by ID User Profile
  static const String getMentorByID = "/api/public/profile/mentor/by-id-profile";

  // Get Data Tabs Bisnis Kreatif / Keterampilan Kreatif
  static const String getListDataTabs = "/api/public/courses/list";

  // Get Details Course Bisnis Kreatif dan Keterampilan Kreatif
  static const String getDetailsCourseTabs = "/api/public/courses/";

  // Get Data Course by ID Mentor
  static const String getListCourseByIDMentor = "/api/public/courses/list/by-mentor-profile";

  // Get Materi by ID Course
  static const String getListMateriCourse = "/api/public/courses/materi/list";

  // Get Course Owned
  static const String getListCourseOwned = "/api/courses/list/owned";

  // CheckoutCourse
  static const String checkOutCourse = "/api/purchasing/checkout";

  // Transaction History
  static const String getTransactionHistory = "/api/purchasing/detail/status";
}

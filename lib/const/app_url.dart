class AppUrls {
  static String baseurl = "http://localhost:5000/api/";

  static String  loginUrl = "${baseurl}student/login";
  static String  adminloginUrl = "${baseurl}admin/login";
  static String  facultyloginUrl = "${baseurl}faculty/login";
  static String  attendenceUrl = "${baseurl}student/checkAttendence";
  static String  profileUpdateUrl = "${baseurl}student/updateProfile";
  static String  subjectListUrl = "${baseurl}student/getAllSubjects";
  static String  fetchStudent = "${baseurl}faculty/fetchStudents";
  static String  markAttendences = "${baseurl}faculty/markAttendence";
  static String  getallexam = "${baseurl}admin/getAllExam";
  static String  searchStudent = "${baseurl}student/getStudentByName";


}
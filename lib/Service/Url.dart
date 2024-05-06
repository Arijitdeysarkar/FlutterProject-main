class Url {
// https://dev8.ivantechnology.in/appointmentschedulear/api/login

  static const baseUrl = "dev8.ivantechnology.in";
  static const bool isStaging = true;
  static const path = "/appointmentschedulear";
  static const login = "$path/api/login"; // 2
  static const appointmentListing = "$path/api/appointment/listing"; // 4
  // static const allCustomer = "$path/api/all-customer"; // 19
  static const listCustomer = "$path/api/listCustomers"; // 15
  static const customerWiseAppointmentList =
      "$path/api/appointment/dashboard"; // 17
  static const addOrEditCustomer = "$path/api/addCustomer"; // 16
  static const listStaff = "$path/api/listStaff"; // 23
  static const appointmentDelete = "$path/api/appointment/delete"; // 14
  static const viewSingleAppointment = "$path/api/viewAppointment"; // 12
  static const reSchedule = "$path/api/reSchedule"; // 13
  static const forgotPassword = "$path/api/forgotPassword"; // 36
  static const createAppointment = "$path/api/appointment/add"; // 09
  static const monthlyAppointmentReports = "$path/api/monthlyReport"; // 32
  static const editAppointmentByDraging = "$path/api/appointment/edit"; // 11
  static const serviceList = "$path/api/service/listing"; // 5
  static const dailyCustomers = "$path/api/dailyCustomers"; // 8
}

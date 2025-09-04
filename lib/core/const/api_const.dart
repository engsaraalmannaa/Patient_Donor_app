import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_my_consultation.dart';

class ApiConst {
  static const baseUrl = 'https://f59b011626bc.ngrok-free.app';

  static const loginpatient = '/api/patient/login';
  static const logindonor = '/api/donor/login';

  static const registerpatient = '/api/patient/register';
  static const registerdonor = '/api/donor/register';

  static const indexconsultations = '/api/patient/consultations';
  static const writeconsultations = '/api/patient/consultations/store';
  static showconsultation(int id) => '/api/patient/consultations/$id';
  static deleteconsultation(int id) => '/api/patient/consultations/delete/$id';




  static const appointmentrequest = "/api/patient/appointment-requests/store";
  static deleteappointmentrequest({required int id}) =>
      '/api/patient/appointment-requests/$id';
  static const specialties = '/api/patient/specialties';
  static docbyspecialety({required String id}) =>
      '/api/patient/doctorbyspeciality/$id';




  static const profileshow = '/api/patients/profile';
  static const profileedit = '/api/patients/profile';


  static const indexappointment = "/api/patient/appointments/";
  static const indexappointmentrequest = "/api/patient/appointment-requests/";

  static rejectappointment(int id) => '/api/patient/appointments/$id/reject';
  static acceptappointment(int id) => '/api/patient/appointments/$id/accept';

  

  static const storedisease = "/api/patient/diseases/store";
  static const indexdisease = "/api/patient/diseases/";


  static const indexmyconsultation = "/api/patient/consultations/my-consultations";
  static deletemyconsultation(int id) => '/api/patient/consultations/delete/$id';
  static updatemyconsultation(int id) => '/api/patient/consultations/update/$id';





// donor
  static const updateprofile = '/api/donor/profile';
  static  const showprofile = '/api/donor/profile';




  static const indexmydonation = '/api/donor/donations';
  static showmydonation(int id) => '/api/donor/donations/$id';
  static editmydonation(int id) => '/api/donor/donations/update/$id';




  
  static const indexdiseas = '/api/donor/diseases/';
  static showdisease(int id) => '/api/donor/diseases/$id';

  static const postdonation = '/api/donor/donations/store/';


}

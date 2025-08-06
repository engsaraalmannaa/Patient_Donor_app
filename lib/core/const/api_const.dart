import 'package:Pationt_Donor/modules/patient/presentation/screens/appointment.dart';
import 'package:Pationt_Donor/modules/patient/presentation/screens/show_consultation.dart';

class ApiConst {
  static const baseUrl = 'https://99cfc0ea053c.ngrok-free.app';

  static const loginpatient = '/api/patient/login';
  static const logindonor = '/api/donor/login';

  static const registerpatient = '/api/patient/register';
  static const registerdonor = '/api/donor/register';

  static const indexconsultations = '/api/patient/consultations';
  static const writeconsultations = '/api/patient/consultations/store';
  static showconsultation(int id) => '/api/patient/consultations/$id';
  static deleteconsultation(int id) => '/api/patient/consultations/delete/$id';




  static const appointmentrequest = "/api/patient/appointment-requests/store";
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

// donor
  static const updateprofile = '/api/donor/profile';
  static  const showprofile = '/api/donor/profile';




  static const indexmydonation = '/api/donor/donations';



  
  static const indexdiseas = '/api/donor/diseases/';
  static showdisease(int id) => '/api/donor/diseases/$id';

}


class ConsultationModel {
  int? id;
  int? specialtyId;
  int? patientId;
  String? question;
  String? createdAt;
  String? updatedAt;
  Patient? patient;
  Specialty? specialty;

  ConsultationModel(
      {this.id,
      this.specialtyId,
      this.patientId,
      this.question,
      this.createdAt,
      this.updatedAt,
      this.patient,
      this.specialty});

  ConsultationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    patientId = json['patient_id'];
    question = json['question'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    patient =
        json['patient'] != null ? new Patient.fromJson(json['patient']) : null;
    specialty = json['specialty'] != null
        ? new Specialty.fromJson(json['specialty'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialty_id'] = this.specialtyId;
    data['patient_id'] = this.patientId;
    data['question'] = this.question;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.specialty != null) {
      data['specialty'] = this.specialty!.toJson();
    }
    return data;
  }
}

class Patient {
  int? id;
  int? userId;
  String? firstName;
  String? fatherName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? nationalNumber;
  String? address;
  String? phone;
  String? email;
  String? socialStatus;
  String? emergencyNum;
  String? insuranceCompany;
  String? insuranceNum;
  int? smoker;
  int? pregnant;
  String? bloodType;
  String? geneticDiseases;
  String? chronicDiseases;
  String? drugAllergy;
  String? lastOperations;
  String? presentMedicines;
  String? status;
  String? createdAt;
  String? updatedAt;
  User? user;

  Patient(
      {this.id,
      this.userId,
      this.firstName,
      this.fatherName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.nationalNumber,
      this.address,
      this.phone,
      this.email,
      this.socialStatus,
      this.emergencyNum,
      this.insuranceCompany,
      this.insuranceNum,
      this.smoker,
      this.pregnant,
      this.bloodType,
      this.geneticDiseases,
      this.chronicDiseases,
      this.drugAllergy,
      this.lastOperations,
      this.presentMedicines,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    fatherName = json['father_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    nationalNumber = json['national_number'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    socialStatus = json['social_status'];
    emergencyNum = json['emergency_num'];
    insuranceCompany = json['insurance_company'];
    insuranceNum = json['insurance_num'];
    smoker = json['smoker'];
    pregnant = json['pregnant'];
    bloodType = json['blood_type'];
    geneticDiseases = json['genetic_diseases'];
    chronicDiseases = json['chronic_diseases'];
    drugAllergy = json['drug_allergy'];
    lastOperations = json['last_operations'];
    presentMedicines = json['present_medicines'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['father_name'] = this.fatherName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['national_number'] = this.nationalNumber;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['social_status'] = this.socialStatus;
    data['emergency_num'] = this.emergencyNum;
    data['insurance_company'] = this.insuranceCompany;
    data['insurance_num'] = this.insuranceNum;
    data['smoker'] = this.smoker;
    data['pregnant'] = this.pregnant;
    data['blood_type'] = this.bloodType;
    data['genetic_diseases'] = this.geneticDiseases;
    data['chronic_diseases'] = this.chronicDiseases;
    data['drug_allergy'] = this.drugAllergy;
    data['last_operations'] = this.lastOperations;
    data['present_medicines'] = this.presentMedicines;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  bool? isAdmin;
  bool? isDoctor;
  bool? isPatient;
  bool? isDonor;

  User(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.isAdmin,
      this.isDoctor,
      this.isPatient,
      this.isDonor});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isAdmin = json['is_admin'];
    isDoctor = json['is_doctor'];
    isPatient = json['is_patient'];
    isDonor = json['is_donor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_admin'] = this.isAdmin;
    data['is_doctor'] = this.isDoctor;
    data['is_patient'] = this.isPatient;
    data['is_donor'] = this.isDonor;
    return data;
  }
}

class Specialty {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Specialty({this.id, this.name, this.createdAt, this.updatedAt});

  Specialty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

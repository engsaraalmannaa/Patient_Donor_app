class PatientProfileModel {
  int? status;
  String? message;
  Data? data;

  PatientProfileModel({this.status, this.message, this.data});

  PatientProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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

  Data(
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
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
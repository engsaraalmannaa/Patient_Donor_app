class MyDiseaseModel {
  int? status;
  String? message;
  List<Data>? data;

  MyDiseaseModel({this.status, this.message, this.data});

  MyDiseaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? specialtyId;
  int? doctorId;
  int? patientId;
  String? patientStatus;
  int? availableMoney;
  int? neededAmount;
  int? collectedAmount;
  String? urgencyLevel;
  String? finalTime;
  String? donationStatus;
  String? createdAt;
  String? updatedAt;
  int? isShown;
  Doctor? doctor;
  Patient? patient;
  Specialty? specialty;

  Data(
      {this.id,
      this.specialtyId,
      this.doctorId,
      this.patientId,
      this.patientStatus,
      this.availableMoney,
      this.neededAmount,
      this.collectedAmount,
      this.urgencyLevel,
      this.finalTime,
      this.donationStatus,
      this.createdAt,
      this.updatedAt,
      this.isShown,
      this.doctor,
      this.patient,
      this.specialty});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    patientStatus = json['patient_status'];
    availableMoney = json['available_money'];
    neededAmount = json['needed_amount'];
    collectedAmount = json['collected_amount'];
    urgencyLevel = json['urgency_level'];
    finalTime = json['final_time'];
    donationStatus = json['donation_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isShown = json['is_shown'];
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
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
    data['doctor_id'] = this.doctorId;
    data['patient_id'] = this.patientId;
    data['patient_status'] = this.patientStatus;
    data['available_money'] = this.availableMoney;
    data['needed_amount'] = this.neededAmount;
    data['collected_amount'] = this.collectedAmount;
    data['urgency_level'] = this.urgencyLevel;
    data['final_time'] = this.finalTime;
    data['donation_status'] = this.donationStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_shown'] = this.isShown;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.patient != null) {
      data['patient'] = this.patient!.toJson();
    }
    if (this.specialty != null) {
      data['specialty'] = this.specialty!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  int? specialtyId;
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
  String? licenseNumber;
  String? experienceYears;
  String? meetCost;
  String? image;
  String? bio;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Doctor(
      {this.id,
      this.specialtyId,
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
      this.licenseNumber,
      this.experienceYears,
      this.meetCost,
      this.image,
      this.bio,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
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
    licenseNumber = json['license_number'];
    experienceYears = json['experience_years'];
    meetCost = json['meet_cost'];
    image = json['image'];
    bio = json['bio'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['specialty_id'] = this.specialtyId;
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
    data['license_number'] = this.licenseNumber;
    data['experience_years'] = this.experienceYears;
    data['meet_cost'] = this.meetCost;
    data['image'] = this.image;
    data['bio'] = this.bio;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
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
      this.updatedAt});

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

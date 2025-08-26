class ShowConsultationModel {
  int? status;
  String? message;
  ConsultationData? data;

  ShowConsultationModel({this.status, this.message, this.data});

  ShowConsultationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null
        ? ConsultationData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }
}

class ConsultationData {
  int? id;
  int? specialtyId;
  int? patientId;
  String? question;
  String? createdAt;
  String? updatedAt;
  Specialty? specialty;
  Patient? patient;
  List<Answer> answers = [];

  ConsultationData({
    this.id,
    this.specialtyId,
    this.patientId,
    this.question,
    this.createdAt,
    this.updatedAt,
    this.specialty,
    this.patient,
    List<Answer>? answers,
  }) {
    this.answers = answers ?? [];
  }

  ConsultationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    patientId = json['patient_id'];
    question = json['question'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    specialty = json['specialty'] != null
        ? Specialty.fromJson(json['specialty'])
        : null;
    patient = json['patient'] != null
        ? Patient.fromJson(json['patient'])
        : null;
    answers = (json['answers'] as List?)
            ?.map((e) => Answer.fromJson(e))
            .toList() ??
        [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['specialty_id'] = specialtyId;
    map['patient_id'] = patientId;
    map['question'] = question;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (specialty != null) {
      map['specialty'] = specialty!.toJson();
    }
    if (patient != null) {
      map['patient'] = patient!.toJson();
    }
    map['answers'] = answers.map((e) => e.toJson()).toList();
    return map;
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
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
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

  Patient({
    this.id,
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
    this.user,
  });

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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['id'] = id;
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['father_name'] = fatherName;
    map['last_name'] = lastName;
    map['gender'] = gender;
    map['birth_date'] = birthDate;
    map['national_number'] = nationalNumber;
    map['address'] = address;
    map['phone'] = phone;
    map['email'] = email;
    map['social_status'] = socialStatus;
    map['emergency_num'] = emergencyNum;
    map['insurance_company'] = insuranceCompany;
    map['insurance_num'] = insuranceNum;
    map['smoker'] = smoker;
    map['pregnant'] = pregnant;
    map['blood_type'] = bloodType;
    map['genetic_diseases'] = geneticDiseases;
    map['chronic_diseases'] = chronicDiseases;
    map['drug_allergy'] = drugAllergy;
    map['last_operations'] = lastOperations;
    map['present_medicines'] = presentMedicines;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  bool? isAdmin;
  bool? isDoctor;
  bool? isPatient;
  bool? isDonor;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.isAdmin,
    this.isDoctor,
    this.isPatient,
    this.isDonor,
  });

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
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_admin': isAdmin,
      'is_doctor': isDoctor,
      'is_patient': isPatient,
      'is_donor': isDonor,
    };
  }
}

class Answer {
  int? id;
  int? doctorId;
  int? consultationId;
  String? answer;
  String? createdAt;
  String? updatedAt;
  Doctor? doctor;

  Answer({
    this.id,
    this.doctorId,
    this.consultationId,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.doctor,
  });

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    consultationId = json['consultation_id'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['doctor_id'] = doctorId;
    map['consultation_id'] = consultationId;
    map['answer'] = answer;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (doctor != null) {
      map['doctor'] = doctor!.toJson();
    }
    return map;
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
  String? licenseNumber;
  String? experienceYears;
  String? meetCost;
  String? bio;
  String? imageUrl;
  User? user;

  Doctor({
    this.id,
    this.specialtyId,
    this.userId,
    this.firstName,
    this.fatherName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.licenseNumber,
    this.experienceYears,
    this.meetCost,
    this.bio,
    this.imageUrl,
    this.user,
  });

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specialtyId = json['specialty_id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    fatherName = json['father_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    licenseNumber = json['license_number'];
    experienceYears = json['experience_years'];
    meetCost = json['meet_cost'];
    bio = json['bio'];
    imageUrl = json['image_url'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['specialty_id'] = specialtyId;
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['father_name'] = fatherName;
    map['last_name'] = lastName;
    map['gender'] = gender;
    map['birth_date'] = birthDate;
    map['license_number'] = licenseNumber;
    map['experience_years'] = experienceYears;
    map['meet_cost'] = meetCost;
    map['bio'] = bio;
    map['image_url'] = imageUrl;
    if (user != null) {
      map['user'] = user!.toJson();
    }
    return map;
  }
}


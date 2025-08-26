class MyConsultationsModel {
  int? status;
  String? message;
  List<Consultation>? data;

  MyConsultationsModel({this.status, this.message, this.data});

  factory MyConsultationsModel.fromJson(Map<String, dynamic> json) {
    return MyConsultationsModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<Consultation>.from(
              json['data'].map((x) => Consultation.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data != null
            ? List<dynamic>.from(data!.map((x) => x.toJson()))
            : [],
      };
}

class Consultation {
  int? id;
  int? specialtyId;
  int? patientId;
  String? question;
  String? createdAt;
  String? updatedAt;
  Specialty? specialty;
  List<Answer>? answers;

  Consultation({
    this.id,
    this.specialtyId,
    this.patientId,
    this.question,
    this.createdAt,
    this.updatedAt,
    this.specialty,
    this.answers,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) {
    return Consultation(
      id: json['id'],
      specialtyId: json['specialty_id'],
      patientId: json['patient_id'],
      question: json['question'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      specialty: json['specialty'] != null
          ? Specialty.fromJson(json['specialty'])
          : null,
      answers: json['answers'] != null
          ? List<Answer>.from(json['answers'].map((x) => Answer.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "specialty_id": specialtyId,
        "patient_id": patientId,
        "question": question,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "specialty": specialty?.toJson(),
        "answers": answers != null
            ? List<dynamic>.from(answers!.map((x) => x.toJson()))
            : [],
      };
}

class Specialty {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Specialty({this.id, this.name, this.createdAt, this.updatedAt});

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class Answer {
  // حسب البيانات الحالية، answers فاضي، بس بنعمله كلاس للمستقبل
  Answer();

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer();
  }

  Map<String, dynamic> toJson() => {};
}

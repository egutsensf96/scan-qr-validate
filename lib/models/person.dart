class Person {
  final PersonalData personalData;
  final DocentData docentData;
  final ParentData motherData;
  final ParentData fatherData;
  final MilitarData militarData;

  Person({
    required this.personalData,
    required this.docentData,
    required this.motherData,
    required this.fatherData,
    required this.militarData,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      personalData: PersonalData.fromJson(json['personalData']),
      docentData: DocentData.fromJson(json['docentData']),
      motherData: ParentData.fromJson(json['motherData']),
      fatherData: ParentData.fromJson(json['fatherData']),
      militarData: MilitarData.fromJson(json['militarData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'personalData': personalData.toJson(),
      'docentData': docentData.toJson(),
      'motherData': motherData.toJson(),
      'fatherData': fatherData.toJson(),
      'militarData': militarData.toJson(),
    };
  }
}

class PersonalData {
  final String identification;
  final String name;
  final String middleName;
  final String lastName;
  final String sex;
  final String skinColor;
  final String address;
  final String email;
  final String nativeOf;
  final String country;
  final String town;
  final String province;
  final String politicOrganization;
  final String birthDate;
  final String phone;
  final int sonCount;
  final String orphanKind;
  final String maritalStatus;

  PersonalData({
    required this.identification,
    required this.name,
    required this.middleName,
    required this.lastName,
    required this.sex,
    required this.skinColor,
    required this.address,
    required this.email,
    required this.nativeOf,
    required this.country,
    required this.town,
    required this.province,
    required this.politicOrganization,
    required this.birthDate,
    required this.phone,
    required this.sonCount,
    required this.orphanKind,
    required this.maritalStatus,
  });

  factory PersonalData.fromJson(Map<String, dynamic> json) {
    return PersonalData(
      identification: json['identification'],
      name: json['name'],
      middleName: json['middleName'],
      lastName: json['lastName'],
      sex: json['sex'],
      skinColor: json['skinColor'],
      address: json['address'],
      email: json['email'],
      nativeOf: json['nativeOf'],
      country: json['country'],
      town: json['town'],
      province: json['province'],
      politicOrganization: json['politicOrganization'],
      birthDate: json['birthDate'],
      phone: json['phone'],
      sonCount: json['sonCount'],
      orphanKind: json['orphanKind'],
      maritalStatus: json['maritalStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'identification': identification,
      'name': name,
      'middleName': middleName,
      'lastName': lastName,
      'sex': sex,
      'skinColor': skinColor,
      'address': address,
      'email': email,
      'nativeOf': nativeOf,
      'country': country,
      'town': town,
      'province': province,
      'politicOrganization': politicOrganization,
      'birthDate': birthDate,
      'phone': phone,
      'sonCount': sonCount,
      'orphanKind': orphanKind,
      'maritalStatus': maritalStatus,
    };
  }
}

class DocentData {
  final String studentStatus;
  final String faculty;
  final String courseType;
  final String career;
  final String year;
  final String group;
  final String schoolasticOrigin;
  final String studentType;
  final String academicSituation;
  final String higherEducationInDate;
  final String universityInDate;
  final String registerDate;
  final double academicIndex;
  final double scale;
  final String entrySource;
  final int optionCareer;
  final bool reoffer;
  final int consecutive;
  final String studyRegimen;

  DocentData({
    required this.studentStatus,
    required this.faculty,
    required this.courseType,
    required this.career,
    required this.year,
    required this.group,
    required this.schoolasticOrigin,
    required this.studentType,
    required this.academicSituation,
    required this.higherEducationInDate,
    required this.universityInDate,
    required this.registerDate,
    required this.academicIndex,
    required this.scale,
    required this.entrySource,
    required this.optionCareer,
    required this.reoffer,
    required this.consecutive,
    required this.studyRegimen,
  });

  factory DocentData.fromJson(Map<String, dynamic> json) {
    return DocentData(
      studentStatus: json['studentStatus'],
      faculty: json['faculty'],
      courseType: json['courseType'],
      career: json['career'],
      year: json['year'],
      group: json['group'],
      schoolasticOrigin: json['schoolasticOrigin'],
      studentType: json['studentType'],
      academicSituation: json['academicSituation'],
      higherEducationInDate: json['higherEducationInDate'],
      universityInDate: json['universityInDate'],
      registerDate: json['registerDate'],
      academicIndex: json['academicIndex'],
      scale: json['scale'],
      entrySource: json['entrySource'],
      optionCareer: json['optionCareer'],
      reoffer: json['reoffer'],
      consecutive: json['consecutive'],
      studyRegimen: json['studyRegimen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'studentStatus': studentStatus,
      'faculty': faculty,
      'courseType': courseType,
      'career': career,
      'year': year,
      'group': group,
      'schoolasticOrigin': schoolasticOrigin,
      'studentType': studentType,
      'academicSituation': academicSituation,
      'higherEducationInDate': higherEducationInDate,
      'universityInDate': universityInDate,
      'registerDate': registerDate,
      'academicIndex': academicIndex,
      'scale': scale,
      'entrySource': entrySource,
      'optionCareer': optionCareer,
      'reoffer': reoffer,
      'consecutive': consecutive,
      'studyRegimen': studyRegimen,
    };
  }
}

class ParentData {
  final String name;
  final String level;
  final String ocupation;
  final double salary;
  final String politicOrganization;

  ParentData({
    required this.name,
    required this.level,
    required this.ocupation,
    required this.salary,
    required this.politicOrganization,
  });

  factory ParentData.fromJson(Map<String, dynamic> json) {
    return ParentData(
      name: json['name'],
      level: json['level'],
      ocupation: json['ocupation'],
      salary: json['salary'],
      politicOrganization: json['politicOrganization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'level': level,
      'ocupation': ocupation,
      'salary': salary,
      'politicOrganization': politicOrganization,
    };
  }
}

class MilitarData {
  MilitarData();

  factory MilitarData.fromJson(Map<String, dynamic> json) {
    return MilitarData();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

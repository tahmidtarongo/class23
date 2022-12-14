class StudentInformationModel {

  String? studentName;
  String? fathersName;
  String? mothersName;
  String? dateOfBirth;
  dynamic rollNumber;
  String? studentId;
  String? instituteName;
  String? pictureUrl;
  String? studentGroup;
  String? bloodGroup;
  String? className;
  String? language;
  String? emergencyContactNumber;



  StudentInformationModel({
    this.studentName,
    this.fathersName,
    this.mothersName,
    this.dateOfBirth,
    this.rollNumber,
    this.studentId,
    this.instituteName,
    this.pictureUrl,
    this.studentGroup,
    this.bloodGroup,
    this.className,
    this.language,
    this.emergencyContactNumber
  });

  StudentInformationModel.fromJson(dynamic json) {
    studentName = json['studentName'];
    fathersName = json['fathersName'];
    mothersName = json['mothersName'];
    dateOfBirth = json['dateOfBirth'];
    rollNumber = json['rollNumber'];
    studentId = json['studentId'];
    instituteName = json['instituteName'];
    pictureUrl = json['pictureUrl'];
    studentGroup = json['studentGroup'];
    bloodGroup = json['bloodGroup'];
    className = json['className'];
    language = json['language'];
    emergencyContactNumber = json['emergencyContactNumber'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['studentName'] = studentName;
    map['fathersName'] = fathersName;
    map['mothersName'] = mothersName;
    map['dateOfBirth'] = dateOfBirth;
    map['rollNumber'] = rollNumber;
    map['studentId'] = studentId;
    map['instituteName'] = instituteName;
    map['pictureUrl'] = pictureUrl;
    map['studentGroup'] = studentGroup;
    map['bloodGroup'] = bloodGroup;
    map['className'] = className;
    map['language'] = language;
    map['emergencyContactNumber'] = emergencyContactNumber;
    return map;
  }
}

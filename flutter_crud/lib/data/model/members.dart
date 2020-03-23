class Note {
  //final String title;
  //final String description;
  final String firstName;
  final String lastName;
  final String gender;
  final String dob;
  final String medicalAidName;
  final String medicalAidNumber;
  final String doctorName;
  final String doctorNumber;
  final String id;

  Note({this.firstName, this.lastName, this.gender, this.dob, this.medicalAidName, this.medicalAidNumber, this.doctorNumber, this.doctorName, this.id});

  Note.fromMap(Map<String,dynamic> data, String id):
        firstName=data["firstName"],
        lastName=data["lastName"],
        gender=data["gender"],
        dob=data["dob"],
        medicalAidName=data["medicalAidName"],
        medicalAidNumber=data["medicalAidNumber"],
        doctorName=data["doctorName"],
        doctorNumber=data['doctorNumber'],
        id=id;

  Map<String, dynamic> toMap() {
    return {
      "firstName" : firstName,
      "lastName":lastName,
      "gender" : gender,
      "dob" : dob,
      "medicalAidName" : medicalAidName,
      "medicalAidNumber" : medicalAidNumber,
      "doctorName" : doctorName,
      "doctorNumber" : doctorNumber,
      "id" : id,
    };
  }

}
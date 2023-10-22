import 'package:cloud_firestore/cloud_firestore.dart';


class UserData {
  List<String> courses;
  String? firstName;
  String? lastName;
  int groupSize;
  List<bool>? studyTime;
  List<String>? groups;

  UserData({
    required this.courses,
    required this.groupSize,
    this.firstName,
    this.lastName,
    this.studyTime,
    this.groups,
  });

  factory UserData.defaultUser() => UserData(
        courses: [],
        groupSize: 2,
        //studyTime: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,]
      );

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
      "firstName" : firstName,
      "lastName" : lastName,
      "courses" : courses,
      "groupSize" : groupSize,
      "studyTime" : studyTime,
      "groups" : groups,
    };
  }

  factory UserData.fromFirestore(DocumentSnapshot docSnap) {
    return UserData(courses: (docSnap.get('groups') as List<dynamic>).cast<String>(), 
      firstName: docSnap.get('firstName') as String,
      groupSize: docSnap.get('groupSize') as int,
      groups: (docSnap.get('groups') as List<dynamic>).cast<String>(),
      lastName: docSnap.get('lastName') as String,
      studyTime: (docSnap.get('studyTime') as List<dynamic>).cast<bool>(),
      );
  }
}
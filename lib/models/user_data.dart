import './user_course_preferences.dart';
import '../models/group_data.dart';


class UserData {
  String? firstName;
  String? lastName;
  List<UserCoursePreferences> courses;
  int preferredGroupSize;
  List<bool>? studyTime;
  List<GroupData>? groups;

  UserData({
    required this.courses,
    required this.preferredGroupSize,
    this.firstName,
    this.lastName,
    this.studyTime
  });

  factory UserData.defaultUser() => UserData(
        courses: [],
        preferredGroupSize: 2,
        //studyTime: [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,]
      );

  Map<String, dynamic> firestoreRepresentation() {
    final _userData = <String, dynamic>{
      "firstName" : firstName,
      "lastName" : lastName,
      "courses" : courses,
      "groupSize" : preferredGroupSize,
      "studyTime" : studyTime
    };
    return _userData;
  }

  
}

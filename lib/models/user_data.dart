import './user_course_preferences.dart';

class UserData {
  String? firstName;
  String? lastName;
  List<UserCoursePreferences> courses;
  int preferredGroupSize;

  UserData({
    required this.courses,
    required this.preferredGroupSize,
    this.firstName,
    this.lastName,
  });

  factory UserData.defaultUser() => UserData(
        courses: [],
        preferredGroupSize: 2,
      );
}

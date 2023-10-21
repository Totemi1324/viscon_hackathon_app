import 'dart:ffi';
import '../models/group_course_properties.dart';


class GroupData {
  List<String>? members;
  List<Bool>? studyTime;
  List<GroupCourseProperties>? courseProperties;
  String ownerId;
  String? privateDescription;
  String? publicDescription;
  String title;

  GroupData({
    required this.ownerId,
    required this.title,
    this.members,
    this.studyTime,
    this.courseProperties,
    this.privateDescription,
    this.publicDescription,
  });
}
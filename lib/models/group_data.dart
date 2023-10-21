import 'dart:ffi';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/group_course_properties.dart';


class GroupData {
  Map<String, GroupCourseProperties>? courseProperties;
  List<String>? courses;
  List<String>? members;
  String ownerId;
  String? privateDescription;
  String? publicDescription;
  List<Bool>? studyTime;
  String title;

  GroupData({
    required this.ownerId,
    required this.title,
    this.members,
    this.studyTime,
    this.courseProperties,
    this.privateDescription,
    this.publicDescription,
    this.courses,
  });

  factory GroupData.fromFirestore(DocumentSnapshot docSnap) {
      Map<String, GroupCourseProperties> coursePreferencesLocal = <String, GroupCourseProperties>{};
      Map<String, Map> coursePreferencesRaw = docSnap.get('coursePreferences');

      coursePreferencesRaw.forEach((key, value) { 
        coursePreferencesLocal.putIfAbsent(key, () => GroupCourseProperties.fromMap(value));
      });

    return GroupData(ownerId: docSnap.get('ownerID'), 
      title: docSnap.get('title'), 
      members: docSnap.get('members'), 
      courses: docSnap.get('courses'),
      studyTime: docSnap.get('studyTime'), 
      courseProperties: coursePreferencesLocal,
      privateDescription: docSnap.get('privateDescription'),
      publicDescription: docSnap.get('publicDescription'),
      );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic> {
      'ownerId': ownerId,
      'title': title,
      'members': members,
      'courses': courses,
      'studyTime': studyTime,
      'courseProperties': courseProperties,
      'privateDescription': privateDescription,
      'publicDescription': publicDescription,
    };
  }
}
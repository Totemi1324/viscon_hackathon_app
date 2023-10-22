import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/group_course_properties.dart';

class GroupData {
  Map<String, GroupCourseProperties>? courseProperties;
  List<String>? courses;
  List<String>? members;
  String ownerId;
  String? privateDescription;
  String? publicDescription;
  List<bool>? studyTime;
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
    Map<String, GroupCourseProperties> coursePropertiesLocal =
        <String, GroupCourseProperties>{};
    Map<String, dynamic> coursePropertiesRaw = docSnap.get('courseProperties') as Map<String, dynamic>;

    for (var key in coursePropertiesRaw.keys) {
      final coursePropertyTable =
          coursePropertiesRaw[key] as Map<String, dynamic>;
      coursePropertiesLocal.putIfAbsent(
          key, () => GroupCourseProperties.fromMap(coursePropertyTable));
    }

    return GroupData(
      ownerId: docSnap.get('ownerID') as String,
      title: docSnap.get('title') as String,
      members: (docSnap.get('members') as List<dynamic>).cast<String>(),
      courses: (docSnap.get('courses') as List<dynamic>).cast<String>(),
      studyTime: (docSnap.get('studyTime') as List<dynamic>).cast<bool>(),
      courseProperties: coursePropertiesLocal,
      privateDescription: docSnap.get('privateDescription') as String,
      publicDescription: docSnap.get('publicDescription') as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic>{
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

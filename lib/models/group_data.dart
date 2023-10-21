import 'dart:ffi';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

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

  factory GroupData.fromFirestore(DocumentSnapshot docSnap) {
    
    List<GroupCourseProperties> localCourseProperties = [];
    Map<String, Map> courses = docSnap.get("courseProperties");
    
    int i = 0;
    courses.forEach((k, v) {
      localCourseProperties.add(GroupCourseProperties.fromMap(k, v));
      i++;
    });

    return GroupData(ownerId: docSnap.get("ownerID"), 
      title: docSnap.get("title"), 
      members: docSnap.get("members"), 
      studyTime: docSnap.get("studyTime"), 
      courseProperties: localCourseProperties,
      privateDescription: docSnap.get("privateDescription"),
      publicDescription: docSnap.get("publicDescription"),
      );
  }
}
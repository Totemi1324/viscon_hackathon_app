import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_data.dart';
import '../models/user_course_preferences.dart';
import '../models/course_data.dart';

class DatabaseService extends Cubit<UserData> {
  final _database = FirebaseFirestore.instance;

  DatabaseService() : super(UserData.defaultUser());

  // State management
  void fullReset() => emit(UserData.defaultUser());

  //Database interaction
  Future createNewUser(String userId) async {}

  Future updateUserData(String userId, List<UserCoursePreferences> courses,
      int preferredGroupSize,
      {String? firstName, String? lastName}) async {}

  Future<List<CourseData>> getCoursesForQuery(String titleQuery) async {}
}

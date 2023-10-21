import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_data.dart';
import '../models/user_course_preferences.dart';
import '../models/course_data.dart';
import '../models/group_data.dart';
import '../models/group_course_properties.dart';

class DatabaseService extends Cubit<UserData> {
  final _database = FirebaseFirestore.instance;

  DatabaseService() : super(UserData.defaultUser());

  // State management
  void fullReset() => emit(UserData.defaultUser());

  //Database interaction
  Future createNewUser(String userId) async {
    final newUserRef = _database.collection("users").doc(userId);
    newUserRef.get().then((value) {
      return;
    },
    onError: (e) {
      final userData = UserData.defaultUser().firestoreRepresentation();
      newUserRef.set(userData);
    }
    );
    
  }

  Future updateUserData(String userId, List<UserCoursePreferences> courses,
      int preferredGroupSize,
      {String? firstName, String? lastName}) async {
        var docRef = _database.collection("users").doc("userId");
        Map<String, dynamic> result = <String, dynamic> {
          "courses" : courses,
          "groupSize" : preferredGroupSize,
          "studyTime" : getUserDataPoint(userId, "studyTime"),
          "firstName" : getUserDataPoint(userId, "firstName"),
          "lastName" : getUserDataPoint(userId, "lastName"),
          "groups" : getUserDataPoint(userId, "groups"),
          };
        if (firstName != null) {
          result["firstName"] = firstName;
        }
        if (lastName != null) {
          result["lastName"] = lastName;
        }
      
      }

  Future<List<CourseData>> getCoursesForQuery(String courseId) async {
    final coursesRef = _database.collection("courses");
    List<CourseData> result = [];
    coursesRef.where("id", isEqualTo: "courseId")
      .get()
      .then((QuerySnapshot querySnapshot) {
          for (var docSnapshot in querySnapshot.docs)
          {
            //read out data
            result.add(CourseData.fromFirestore(docSnapshot));
          }
        },
        onError: (e) {
          return [];
        },
      );

    return result;
  }

  Future<T?> getUserDataPoint<T>(String userId, String dataPoint) async {//dataPoint is the Name of the data point in Firestore
    var docRef = _database.collection("users").doc(userId);
    T? result;
    docRef.get().then((docSnap) {
      if(docSnap.exists) {
        return docSnap.get(dataPoint);
      }
      else {
        return null;
      }
      
    });

    return null;
  }

  Future<T?> getUserCoursePreferenceDataPoint<T>(String userCoursePreferenceId, String dataPoint) async {//dataPoint is the Name of the data point in Firestore
    var docRef = _database.collection("userCoursePreference").doc(userCoursePreferenceId);
    T? result;
    docRef.get().then((docSnap) {
      if(docSnap.exists) {
        return docSnap.get(dataPoint);
      }
      else {
        return null;
      }
      
    });

    return null;
  }

  List<GroupData> getUserGroups(String userId) {}

  Future<GroupData> getGroup(String groupId) {}
}

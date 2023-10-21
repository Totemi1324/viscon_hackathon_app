import 'dart:async';

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
    final newUserRef = getDocRefFromUserId(userId);      
    final userData = UserData.defaultUser().toFirestore();
      try {
        newUserRef.set(userData);
      }
      catch (e) {
        return;
      }
  }

  Future createNewGroup(String )

  Future updateUserData(
      String userId, List<String> courses, int groupSize, List<String> groups,
      {String? firstName, String? lastName, List<bool>? studyTime}) async {
    Map<String, dynamic>? userData;
    try {
      userData = 
        (await _database.collection('users').doc(userId).get()).data();

      userData!['courses'] = courses;
      userData!['groupSize'] = groupSize;
      userData!['groups'] = groups;
      if (firstName != null) {
        userData!["firstName"] = firstName;
      }
      if (lastName != null) {
        userData!["lastName"] = lastName;
      }
      if (studyTime != null) {
        userData!['studyTime'] = studyTime;
      }
      _database.collection("users").doc(userId).set(userData!);
    }
    catch (e) {
      return;
    }
  }

  Future<List<CourseData>> getCoursesForQuery(String courseId) async {
    final coursesRef = _database.collection("courses");
    List<CourseData> result = [];

    try {
      final candidates =
          await coursesRef.where("id", isEqualTo: courseId).get();
      for (var docSnapshot in candidates.docs) {
        //read out data
        result.add(CourseData.fromFirestore(docSnapshot));
      }
    } catch (e) {
      return [];
    }

    return result;
  }

  Future<T?> getUserCoursePreferenceDataPoint<T>(
      String userCoursePreferenceId, String dataPoint) async {
    //dataPoint is the Name of the data point in Firestore
    try {
      final docSnap = 
        await _database.collection('userCoursePreferences').doc(userCoursePreferenceId).get();
      if (docSnap.exists && docSnap.data() != null) {
        try{
          return docSnap.data()![dataPoint];
        }
        catch (e) {
          return null;
        }
      }
      return null;
    }
    catch (e) {
      return null;
    }
  }

  Future<List<String>?> getUserGroups(String userId) async {
    return getUserDataPoint<List<String>>(userId, "groups");
  }

  Future<GroupData?> getGroup(String groupId) async {
    try {
      final docSnap = 
        await _database.collection("groups").doc(groupId).get();
      if (docSnap.exists) {
        return GroupData.fromFirestore(docSnap);
      }
      else {
        return null;
      }
    }
    catch (e) {
      return null;
    }
  }

  String getUserCoursePreferenceId(String userId, String courseId) {
    return userId + "-" + courseId;
  }

  Future<DocumentSnapshot?> getDocSnapFromUserId(String userId) async {
    try {
      final docSnap = 
        await _database.collection('users').doc(userId).get();
        if (docSnap.exists) {
          return docSnap;
        }
        return null;
    }
    catch (e) {
      return null;
    }
  }

  DocumentReference getDocRefFromUserId(String userId) {
    return _database.collection('users').doc(userId);
  }

  Future<T?> getUserDataPoint<T>(String userId, String dataPoint) async {
    //dataPoint is the Name of the data point in Firestore
    try {
      final docSnap = 
        await (await getDocSnapFromUserId(userId));
      if (docSnap != null || docSnap!.exists) {
        try {
          return (docSnap!.data() as Map)[dataPoint];
        }
        catch (e) {
          return null;
        }
      }
      return null;
    }
    catch (e) {
      return null;
    }
  }
}

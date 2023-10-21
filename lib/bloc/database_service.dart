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
    final newUserRef = _database.collection("users").doc(userId);
    newUserRef.get().then((value) {
      return;
    }, onError: (e) {
      final userData = UserData.defaultUser().toFirestore();
      newUserRef.set(userData);
    });
  }

  Future updateUserData(
      String userId, List<String> courses, int groupSize, List<String> groups,
      {String? firstName, String? lastName, List<bool>? studyTime}) async {
    Map<String, dynamic>? userData;
    _database.collection('users').doc(userId).get().then((docSnap) {
      if (docSnap.exists) {
        userData = docSnap.data();
      } else {
        return;
      }
    });
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

  Future<List<String>> getCoursesForQuery(String courseId) async {
    final coursesRef = _database.collection("courses");
    List<String> result = [];
    coursesRef.where("id", isEqualTo: "courseId").get().then(
      (QuerySnapshot querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          //read out data
          result.add(CourseData.fromFirestore(docSnapshot).id);
        }
      },
      onError: (e) {
        return [];
      },
    );

    return result;
  }

  Future<T?> getUserCoursePreferenceDataPoint<T>(
      String userCoursePreferenceId, String dataPoint) async {
    //dataPoint is the Name of the data point in Firestore
    _database
        .collection('userCoursePreferences')
        .doc(userCoursePreferenceId)
        .get()
        .then((docSnap) {
      if (docSnap.exists && docSnap.data() != null) {
        return docSnap.data()![dataPoint];
      }
    });
    return null;
  }

  Future<List<String>?> getUserGroups(String userId) async {
    return getUserDataPoint<List<String>>(userId, "groups");
  }

  Future<GroupData?> getGroup(String groupId) async {
    _database.collection("groups").doc(groupId).get().then((docSnap) {
      if (docSnap.exists) {
        return GroupData.fromFirestore(docSnap);
      }
    });

    return null;
  }

  String getUserCoursePreferenceId(String userId, String courseId) {
    return userId + "-" + courseId;
  }

  Future<DocumentSnapshot?> getDocSnapFromUserId(String userId) async {
    _database.collection('users').doc(userId).get().then((docSnap) {
      if (docSnap.exists) {
        return docSnap;
      }
    });
    return null;
  }

  DocumentReference getDocRefFromUserId(String userId) {
    return _database.collection('users').doc(userId);
  }

  Future<Map<String, dynamic>?> getDataFromUserId(String userId) async {
    _database.collection('users').doc(userId).get().then((docSnap) {
      if (docSnap.exists) {
        return docSnap.data();
      }
    });
    return null;
  }

  Future<T?> getUserDataPoint<T>(String userId, String dataPoint) async {
    //dataPoint is the Name of the data point in Firestore
    _database.collection('users').doc(userId).get().then((docSnap) {
      if (docSnap.exists && docSnap.data() != null) {
        return docSnap.data()![dataPoint];
      }
    });
    return null;
  }
}

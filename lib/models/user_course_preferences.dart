import 'package:cloud_firestore/cloud_firestore.dart';

class UserCoursePreferences {
  String courseId;
  Map<String, bool> learnMethods;
  int courseSkilLevel;
  bool homogenes;

  UserCoursePreferences({
    required this.courseId,
    required this.courseSkilLevel,
    required this.homogenes,
    required this.learnMethods,
  });

  factory UserCoursePreferences.defaultPrefs(String courseId) => UserCoursePreferences(
        courseId: courseId,
        courseSkilLevel: 1,
        homogenes: false,
        learnMethods: <String, bool> {
          "compareWork" : false,
          "exercises" : false,
          "learnTheory" : false,
          "lectureRecap" : false,
          "workTogether" : false,
        },
      );

  factory UserCoursePreferences.fromFirestore(DocumentSnapshot docSnap) {
    final learnMethodsLocal = <String, bool> {}; 
    final learnMethodsRaw = docSnap.get('learnMethods') as Map<String, bool>;

    learnMethodsRaw.forEach((key, value) {
      learnMethodsLocal.putIfAbsent(key, () => value);
    });

    return UserCoursePreferences(courseId: docSnap.get('courseId') as String, 
      courseSkilLevel: docSnap.get('courseSkilLevel') as int, 
      homogenes: docSnap.get('homogenes') as bool, 
      learnMethods: learnMethodsLocal,
      );
  }

  Map<String, dynamic> toFirestore() {
    return <String, dynamic> {'courseId' : courseId,
      'courseSkilLevel' : courseSkilLevel,
      'homogenes' : homogenes,
      'learnMethods' : learnMethods,
    };
  }
}

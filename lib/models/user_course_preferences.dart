import 'package:cloud_firestore/cloud_firestore.dart';

class UserCoursePreferences {
  String courseId;
  List<bool> learnMethods;
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
        learnMethods: [false, false, false, false, false,],
      );

  factory UserCoursePreferences.fromFirestore(DocumentSnapshot docSnap) {
    return UserCoursePreferences(courseId: docSnap.get('courseId'), 
      courseSkilLevel: docSnap.get('courseSkilLevel'), 
      homogenes: docSnap.get('homogenes'), 
      learnMethods: docSnap.get('learnMethods'),
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

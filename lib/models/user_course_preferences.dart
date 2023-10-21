import './learning_method.dart';
import './niveau.dart';

class UserCoursePreferences {
  String courseId;
  Set<LearningMethod> preferredLearningMethods;
  int skillLevel;
  Niveau preferredNiveau;

  UserCoursePreferences({
    required this.courseId,
    required this.skillLevel,
    required this.preferredNiveau,
    required this.preferredLearningMethods,
  });

  factory UserCoursePreferences.defaultPrefs() => UserCoursePreferences(
        courseId: "",
        skillLevel: 1,
        preferredNiveau: Niveau.mixed,
        preferredLearningMethods: {},
      );
}

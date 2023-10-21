class GroupCourseProperties {
  String courseId;
  int? skillLevel;
  bool? homogenous;
  Map<String, bool>? learnMethods;

  GroupCourseProperties({
    required this.courseId,
    this.skillLevel,
    this.homogenous,
    this.learnMethods,
  });

  factory GroupCourseProperties.fromMap(String localCourseId, Map<dynamic, dynamic> map) {
    return GroupCourseProperties(courseId: localCourseId, 
      skillLevel: map["couresSkilLevel"],
      homogenous: map["homogenes"],
      learnMethods: map["learnMethods"],
      );
  }
}
class GroupCourseProperties {
  int? courseSkilLevel;
  bool? homogenes;
  Map<String, bool>? learnMethods;

  GroupCourseProperties({
    this.courseSkilLevel,
    this.homogenes,
    this.learnMethods,
  });

  factory GroupCourseProperties.fromMap(Map<dynamic, dynamic> map) {
    return GroupCourseProperties(courseSkilLevel: map["couresSkilLevel"],
      homogenes: map["homogenes"],
      learnMethods: map["learnMethods"],
      );
  }

}
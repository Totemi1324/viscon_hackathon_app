class GroupCourseProperties {
  int? courseSkilLevel;
  bool? homogenes;
  Map<String, bool>? learnMethods;

  GroupCourseProperties({
    this.courseSkilLevel,
    this.homogenes,
    this.learnMethods,
  });

  factory GroupCourseProperties.defaultProps() => GroupCourseProperties(courseSkilLevel: 2,
      homogenes: false,
      learnMethods: [false, false, false, false, false],
      );

  factory GroupCourseProperties.fromMap(Map<dynamic, dynamic> map) {
    return GroupCourseProperties(courseSkilLevel: map["couresSkilLevel"],
      homogenes: map["homogenes"],
      learnMethods: map["learnMethods"],
      );
  }

}
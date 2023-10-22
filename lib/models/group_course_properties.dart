class GroupCourseProperties {
  int? courseSkilLevel;
  bool? homogenes;
  Map<String, int>? learnMethods;

  GroupCourseProperties({
    this.courseSkilLevel,
    this.homogenes,
    this.learnMethods,
  });

  factory GroupCourseProperties.defaultProps() => GroupCourseProperties(
        courseSkilLevel: 2,
        homogenes: false,
        learnMethods: {
          "compareWork": 0,
          "exercises": 0,
          "learnTheory": 0,
          "lectureRecap": 0,
          "workTogether": 0
        },
      );

  factory GroupCourseProperties.fromMap(Map<String, dynamic> map) {
    return GroupCourseProperties(
      courseSkilLevel: map["courseSkilLevel"] as int,
      homogenes: map["homogenes"] as bool,
      learnMethods:
          (map["learnMethods"] as Map<String, dynamic>).cast<String, int>(),
    );
  }
}

class GroupCourseProperties {
  int? courseSkilLevel;
  bool? homogenes;
  Map<String, bool>? learnMethods;

  GroupCourseProperties({
    this.courseSkilLevel,
    this.homogenes,
    this.learnMethods,
  });

  factory GroupCourseProperties.defaultProps() => GroupCourseProperties(
        courseSkilLevel: 2,
        homogenes: false,
        learnMethods: {
          "compareWork": false,
          "exercises": false,
          "learnTheory": false,
          "lectureRecap": false,
          "workTogether": false
        },
      );

  factory GroupCourseProperties.fromMap(Map<String, dynamic> map) {
    return GroupCourseProperties(
      courseSkilLevel: map["courseSkilLevel"] as int,
      homogenes: map["homogenes"] as bool,
      learnMethods:
          (map["learnMethods"] as Map<String, dynamic>).cast<String, bool>(),
    );
  }
}

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
}
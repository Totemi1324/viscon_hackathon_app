class MatchedGroup {
  final String groupId;
  final double matchScore;

  MatchedGroup(this.groupId, this.matchScore);

  MatchedGroup.fromJson(Map<String, dynamic> json)
      : groupId = json["group_id"] as String,
        matchScore = json["score"] as double;
}

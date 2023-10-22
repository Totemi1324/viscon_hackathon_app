import 'package:cloud_firestore/cloud_firestore.dart';

class CourseData {
  String id;
  List<Map<String, String>> lecturer;
  String? title;

  CourseData({
    required this.id,
    required this.lecturer,
    this.title,
  });

  factory CourseData.fromFirestore(DocumentSnapshot docSnap) {
    final lecsRaw = docSnap.get('lecturer') as List<dynamic>;
    List<Map<String, String>> lecsParsed = [];

    for (var lec in lecsRaw) {
      final lecMap = lec as Map<String, dynamic>;
      lecsParsed.add(lecMap.cast<String, String>());
    }

    return CourseData(
      id: docSnap.get('id'),
      lecturer: lecsParsed,
      title: docSnap.get('title'),
    );
  }
}

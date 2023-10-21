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
    return CourseData(id: docSnap.get('id'), 
    lecturer: docSnap.get('lecturer'),
    title: docSnap.get('title'),
    );
  }
}

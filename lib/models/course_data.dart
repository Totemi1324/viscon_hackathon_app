import 'package:tuple/tuple.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseData {
  String id;
  List<Tuple3<String, String, String>> lecturers;
  String? title;

  CourseData({
    required this.id,
    required this.lecturers,
    this.title,
  });

  factory CourseData.fromFirestore(DocumentSnapshot doc)
  {
    String idLocal = doc.get('id');
    List<Tuple3<String, String, String>> lecturersLocal = [];

    List<Map<String, dynamic>> lecs = doc.get('lecturer');
    for (int i = 0; i < lecs.length; i++) {
      Map<String, dynamic> lec = lecs[i];
      lecturersLocal.add(Tuple3((lec["first_Name"]), lec["last_Name"], lec["title"]));
    }
    String? titleLocal = doc.get('title');

    return CourseData(id: idLocal, lecturers: lecturersLocal, title: titleLocal);
  }
}

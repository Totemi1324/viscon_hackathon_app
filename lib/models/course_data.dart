import 'package:tuple/tuple.dart';

class CourseData {
  String id;
  List<Tuple3<String, String, String>> lecturers;
  String? title;

  CourseData({
    required this.id,
    required this.lecturers,
    this.title,
  });
}

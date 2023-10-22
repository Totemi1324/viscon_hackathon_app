import 'package:flutter/material.dart';

import './course_search.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return CourseSearch(onSelect: (_) {});
  }
}

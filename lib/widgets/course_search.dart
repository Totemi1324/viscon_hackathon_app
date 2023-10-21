import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../models/course_data.dart';

class CourseSearch extends StatefulWidget {
  final Function(CourseData) onSelect;

  const CourseSearch({required this.onSelect, super.key});

  @override
  State<CourseSearch> createState() => _CourseSearchState();
}

class _CourseSearchState extends State<CourseSearch> {
  String _searchQuery = "";
  List<CourseData> _currentResults = [
    CourseData(
      id: "101-5014-50L",
      lecturers: [
        Tuple3("Bernd", "Gärtner", "Prof. Dr."),
        Tuple3("Alfonso", "Bandeira", ""),
      ],
      title: "Lineare Algebra",
    ),
    CourseData(
      id: "052-0511-23L",
      lecturers: [
        Tuple3("Tom", "Guthknecht", "Dr."),
      ],
      title:
          "Planning Strategies for Complex Buildings Using the Example of Health Facilities",
    ),
  ];

  String generateLecturerString(List<Tuple3> lecturerData) {
    String res = "";
    for (var i = 0; i < lecturerData.length; i++) {
      final lecturer = lecturerData[i];
      res += lecturer.item3 + " " + lecturer.item1 + " " + lecturer.item2;
      if (i != lecturerData.length - 1) {
        res += ", ";
      }
    }
    return res;
  }

  void performSearch(String query) {
    print("e");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Please enter your course ID:"),
        TextFormField(
          style: Theme.of(context).textTheme.bodyLarge,
          autocorrect: false,
          enableSuggestions: false,
          onFieldSubmitted: (value) => performSearch(value),
          onSaved: (newValue) {
            if (newValue != null) {
              _searchQuery = newValue;
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              tooltip: "Search course ID",
              onPressed: () => performSearch(_searchQuery),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _currentResults.length,
          itemBuilder: (context, index) {
            final result = _currentResults[index];
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.5),
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.id,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    Text(
                      result.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      generateLecturerString(result.lecturers),
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import './toggle_button.dart';

class JoinGroupView extends StatelessWidget {
  JoinGroupView({super.key});

  final Set<String> selectedCourses = {};

  Widget listView(List<String> courseTitles) => SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: courseTitles.length,
          itemBuilder: (context, index) => Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: ToggleButton(
                courseTitles[index],
                valueCallback: (courseTitle, toggled) {
                  if (toggled) {
                    selectedCourses.add(courseTitle);
                  } else {
                    selectedCourses.remove(courseTitle);
                  }
                },
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Select courses:",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: listView([
                  "Algorithmen & Datenstrukturen",
                  "Diskrete Mathematik",
                  "Einführung in die Programmierung"
                ]),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Start search!"),
            ),
          ],
        ),
        Container(
          child: Text("AS"),
        )
      ],
    );

    /*return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select courses:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    color: Colors.orange,
                  ),
                ],
              ),
              Container(
                color: Colors.green,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Start search!"),
                ),
              ),
            ],
          ),
        ),
        Container()
      ],
    );*/
  }
}

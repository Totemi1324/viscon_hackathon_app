import 'package:flutter/material.dart';

import '../models/learning_method.dart';
import './toggle_button.dart';
import './group_card.dart';

class JoinGroupView extends StatelessWidget {
  JoinGroupView({super.key});

  final Set<String> selectedCourses = {};

  Widget courseFilters(List<String> courseTitles) => SizedBox(
        height: 60,
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: [
                Colors.white,
                Colors.transparent,
              ],
              stops: [0.9, 1],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              tileMode: TileMode.mirror,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstIn,
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
                child: courseFilters([
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
        Expanded(
          child: ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                colors: [
                  Colors.white,
                  Colors.transparent,
                ],
                stops: [0.9, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: GroupCard(
                  title: "study-moon-werewolves",
                  description:
                      "Wir sind eine mega coole study group mit lauter netten Leuten und freuen uns auf deine Anfrage!",
                  matchScore: 0.87,
                  courseTitles: [
                    "Algorithmen & Datenstrukturen",
                    "Lineare Algebra",
                  ],
                  learningMethods: [
                    LearningMethod.workTogether,
                    LearningMethod.recapLecture,
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

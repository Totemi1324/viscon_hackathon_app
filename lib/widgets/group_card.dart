import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/learning_method.dart';
import './capsule_element.dart';

class GroupCard extends StatelessWidget {
  final String title;
  final String description;
  final double matchScore;
  final List<String> courseTitles;
  final List<LearningMethod> learningMethods;

  const GroupCard({
    required this.title,
    required this.description,
    required this.matchScore,
    required this.courseTitles,
    required this.learningMethods,
    super.key,
  });

  Widget coursesGridView(
          List<String> courseTitles, BuildContext buildContext) =>
      SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: courseTitles.length,
          itemBuilder: (context, index) => Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CapsuleElement(courseTitles[index],
                  color: Theme.of(buildContext).colorScheme.tertiary,
                  textColor: Theme.of(buildContext).colorScheme.onTertiary),
            ),
          ),
        ),
      );

  Widget learningMethodsGridView(
          List<LearningMethod> learningMethods, BuildContext buildContext) =>
      SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: learningMethods.length,
          itemBuilder: (context, index) => Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: CapsuleElement(
                  learningMethodToString(learningMethods[index]),
                  color: Theme.of(buildContext).colorScheme.secondary,
                  textColor: Theme.of(buildContext).colorScheme.onSecondary),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            color: Theme.of(context).colorScheme.primary,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Fächer:",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.tertiary),
                  ),
                  coursesGridView(courseTitles, context),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Lernmethoden:",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                  learningMethodsGridView(learningMethods, context),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    matchScore == 1 ? "Best" : "Match score",
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: const Color.fromRGBO(132, 156, 34, 1.0),
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    matchScore == 1
                        ? "Match"
                        : NumberFormat.percentPattern().format(matchScore),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: const Color.fromRGBO(132, 156, 34, 1.0),
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.navigate_next_rounded,
              size: 50,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            )
          ],
        ),
      ),
    );
  }
}

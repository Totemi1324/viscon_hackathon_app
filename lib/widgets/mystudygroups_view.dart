import 'package:flutter/material.dart';

import '../models/learning_method.dart';
import './group_card.dart';

class MyStudyGroupsView extends StatelessWidget {
  const MyStudyGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
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
    );
  }
}

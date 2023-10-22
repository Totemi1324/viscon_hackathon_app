import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/functions_service.dart';
import '../bloc/authentication_service.dart';
import '../bloc/database_service.dart';

import '../models/learning_method.dart';
import './toggle_button.dart';
import './group_card.dart';

class JoinGroupView extends StatefulWidget {
  const JoinGroupView({super.key});

  @override
  State<JoinGroupView> createState() => _JoinGroupViewState();
}

class _JoinGroupViewState extends State<JoinGroupView> {
  final Set<String> _selectedCourses = {};

  final List<GroupCard> _matchedGroups = [];

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
                      _selectedCourses.add(courseTitle);
                    } else {
                      _selectedCourses.remove(courseTitle);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      );

  Future _startMatching(BuildContext buildContext) async {
    _matchedGroups.clear();
    final userId = buildContext.read<AuthenticationService>().state.userId;
    final funcService = buildContext.read<FunctionsService>();
    final dbService = buildContext.read<DatabaseService>();

    final rawDataPoints = await funcService.getOptimalMatches(userId);
    for (var dataPoint in rawDataPoints) {
      final groupData = await dbService.getGroup(dataPoint.groupId);
      if (groupData != null) {
        _matchedGroups.add(GroupCard(
            title: groupData.title,
            description: groupData.publicDescription ?? "",
            courseTitles: groupData.courses ?? [],
            learningMethods: []));
      }
    }

    setState(() {});
  }

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
              onPressed: () async => await _startMatching(context),
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
              itemCount: _matchedGroups.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                child: _matchedGroups[index],
              ),
            ),
          ),
        )
      ],
    );
  }
}

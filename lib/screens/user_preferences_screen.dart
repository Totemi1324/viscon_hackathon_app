import 'package:flutter/material.dart';

import './base/flat.dart';
import '../widgets/course_search.dart';
import '../widgets/capsule_element.dart';

const List<String> list = <String>["homogenous niveau", "mixed niveau"];

class UserPreferencesScreen extends StatefulWidget {
  static const routeName = "dashboard/preferences";

  const UserPreferencesScreen({super.key});

  @override
  State<UserPreferencesScreen> createState() => _UserPreferencesScreenState();
}

class _UserPreferencesScreenState extends State<UserPreferencesScreen> {
  double _currentGroupSize = 2;
  double _currentSkillLevel = 1;
  String _dropdownValue = "homogenous niveau";

  @override
  Widget build(BuildContext context) {
    return Flat(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Text(
                  "Edit your preferences",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Add course:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Row(
                children: [
                  CapsuleElement(
                    "Algorithmen und Datenstrukturen",
                    color: Theme.of(context).colorScheme.primary,
                    textColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: CourseSearch(
                  onSelect: (_) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Preferred group size:",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Slider(
                value: _currentGroupSize,
                min: 2,
                max: 8,
                divisions: 6,
                label: _currentGroupSize.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentGroupSize = value;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Algorithmen und Datenstrukturen",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.outlineVariant),
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Preferred learning methods:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Skill level:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Slider(
                      value: _currentSkillLevel,
                      min: 1,
                      max: 5,
                      divisions: 4,
                      label: _currentSkillLevel.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSkillLevel = value;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "I prefer a study group with...:",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    DropdownButton<String>(
                        value: _dropdownValue,
                        icon: const Icon(Icons.expand_more_rounded),
                        elevation: 0,
                        onChanged: (String? value) {
                          setState(() {
                            _dropdownValue = value!;
                          });
                        },
                        items: const [
                          DropdownMenuItem<String>(
                            value: "homogenous niveau",
                            child: Text("homogenous niveau"),
                          ),
                          DropdownMenuItem<String>(
                            value: "mixed niveau",
                            child: Text("mixed niveau"),
                          ),
                        ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

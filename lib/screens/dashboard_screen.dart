import 'package:flutter/material.dart';
import './base/with_tabbar.dart';

import '../widgets/joingroup_view.dart';
import '../widgets/mystudygroups_view.dart';
import '../widgets/creategroup_view.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "dashboard";

  const DashboardScreen({super.key});

  Widget safeAreaScrollable(Widget body) => SafeArea(
        child: SingleChildScrollView(
          child: body,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return const WithTabBar(
      title: "NerdHerd",
      myStudyGroupsBody: MyStudyGroupsView(),
      joinGroupBody: JoinGroupView(),
      createGroupBody: CreateGroupView(),
    );
  }
}

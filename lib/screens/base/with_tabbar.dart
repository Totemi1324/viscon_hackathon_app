import 'package:flutter/material.dart';

class WithTabBar extends StatefulWidget {
  final Widget myStudyGroupsBody;
  final Widget joinGroupBody;
  final Widget createGroupBody;
  final String title;

  const WithTabBar({
    required this.myStudyGroupsBody,
    required this.joinGroupBody,
    required this.createGroupBody,
    required this.title,
    super.key,
  });

  @override
  State<WithTabBar> createState() => _WithTabBarState();
}

class _WithTabBarState extends State<WithTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget withSpacing(Widget body) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: body,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Theme.of(context).colorScheme.primary,
                ),
                labelColor: Theme.of(context).colorScheme.onPrimary,
                unselectedLabelColor: Theme.of(context).colorScheme.onSurface,
                tabs: const [
                  Tab(
                    text: 'My study groups',
                  ),
                  Tab(
                    text: 'Join group',
                  ),
                  Tab(
                    text: 'Create group',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  withSpacing(widget.myStudyGroupsBody),
                  withSpacing(widget.joinGroupBody),
                  withSpacing(widget.createGroupBody),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

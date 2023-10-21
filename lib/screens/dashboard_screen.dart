import 'package:flutter/material.dart';
import './base/flat.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "dashboard";

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flat(
      title: "NerdHerd",
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Dashboard",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

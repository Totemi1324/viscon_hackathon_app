import 'package:flutter/material.dart';
import 'package:viscon_hackathon_app/screens/base/flat.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Flat(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Register"),
              ),
              Container(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(LogInScreen.routeName),
                child: const Text("Log in"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

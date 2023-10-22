import 'package:flutter/material.dart';
import 'package:flutter_gen/gen/assets.gen.dart';
import 'package:rive/rive.dart';

import './base/flat.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

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
              SizedBox(
                height: 200,
                child: RiveAnimation.asset(
                  Assets.animations.nerdherdWelcomescreen,
                  fit: BoxFit.contain,
                  stateMachines: const ["Main"],
                ),
              ),
              Text(
                "NerdHerd",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName),
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: const Text("Sign up"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                  padding: const EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed(LogInScreen.routeName),
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: const Text("Log in"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

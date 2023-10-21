import 'package:flutter/material.dart';
import 'package:viscon_hackathon_app/screens/base/flat.dart';

import '../widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "sign-up";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Flat(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    "with your ETH email",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50),
                  child: const SignupForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

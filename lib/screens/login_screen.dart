import 'package:flutter/material.dart';
import 'package:viscon_hackathon_app/screens/base/flat.dart';

import '../widgets/login_form.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = "log-in";

  const LogInScreen({super.key});

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
                    "Log in",
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
                  child: const LogInForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

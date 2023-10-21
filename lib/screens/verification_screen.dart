import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/authentication_service.dart';

import './base/flat.dart';

class VerificationScreen extends StatefulWidget {
  static const routeName = "verification";

  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _sent = false;

  void _onSendConfirmationPressed(BuildContext buildContext) async {
    if (_sent) {
      return;
    }

    try {
      buildContext.read<AuthenticationService>().sendVerificationEmail();
    } catch (error) {
      print(error);
      return;
    }

    setState(() {
      _sent = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flat(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "You're not yet verified. Please click the link in your confirmation email to verify your student status. If you didn't get an email, you can resend it below.",
                ),
                if (!_sent)
                  ElevatedButton(
                    onPressed: () => _onSendConfirmationPressed(context),
                    child: const Text("Send verification email"),
                  ),
                if (_sent) const Text("Verification email sent!"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
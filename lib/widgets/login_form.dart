import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_service.dart';
import '../screens/dashboard_screen.dart';
import '../screens/verification_screen.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordFocusNode = FocusNode();

  bool _isLoading = false;
  String _email = "";
  String _password = "";
  bool _passwordObscured = true;

  Widget emailTextField(BuildContext buildContext) => TextFormField(
        style: Theme.of(context).textTheme.bodyLarge,
        autocorrect: false,
        enableSuggestions: true,
        onFieldSubmitted: (_) =>
            FocusScope.of(context).requestFocus(_passwordFocusNode),
        onSaved: (newValue) {
          if (newValue != null) {
            _email = newValue;
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email address";
          }
          if (!value.trim().endsWith("ethz.ch")) {
            return "The email you provided is not a valid ETH email address.";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      );

  Widget passwordTextField(BuildContext buildContext) => TextFormField(
        style: Theme.of(context).textTheme.bodyLarge,
        autocorrect: false,
        obscureText: _passwordObscured,
        focusNode: _passwordFocusNode,
        enableSuggestions: false,
        onFieldSubmitted: (_) => _onSignInPressed(buildContext),
        onSaved: (newValue) {
          if (newValue != null) {
            _password = newValue;
          }
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(25.0),
            ),
            suffixIcon: IconButton(
              icon: Icon(_passwordObscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded),
              tooltip: "Show password",
              onPressed: () => setState(() {
                _passwordObscured = !_passwordObscured;
              }),
            )),
      );

  void _onSignInPressed(BuildContext buildContext) async {
    setState(() {
      _isLoading = true;
    });

    _formKey.currentState?.save();
    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final authService = buildContext.read<AuthenticationService>();
    final navigator = Navigator.of(buildContext);

    try {
      await authService.attemptLogIn(_email.trim(), _password);

      final verified = authService.isUserVerified();
      if (verified) {
        navigator.pushNamedAndRemoveUntil(
            DashboardScreen.routeName, (_) => false);
      } else {
        navigator.pushNamed(VerificationScreen.routeName);
      }
    } catch (error) {
      print(error.toString());
      setState(() {
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = false;
    });

    print("Success!");
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email address (ending with ethz.ch)",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: emailTextField(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Password",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: passwordTextField(context),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _onSignInPressed(context),
              child: _isLoading
                  ? const Text("Please wait...")
                  : const Text("Log in"),
            ),
          ],
        ),
      ),
    );
  }
}

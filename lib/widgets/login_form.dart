import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  Widget emailTextField(BuildContext buildContext) => TextFormField(
        style: Theme.of(context).textTheme.bodyMedium,
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
        style: Theme.of(context).textTheme.bodyMedium,
        autocorrect: false,
        obscureText: true,
        focusNode: _passwordFocusNode,
        enableSuggestions: false,
        onFieldSubmitted: (_) {},
        onSaved: (newValue) {
          if (newValue != null) {
            _email = newValue;
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
        ),
      );

  void _onSignInPressed(BuildContext buildContext) /*async*/ {
    setState(() {
      _isLoading = true;
    });

    if (!_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    setState(() {
      _isLoading = false;
    });
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
                    style: Theme.of(context).textTheme.labelSmall,
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
                    style: Theme.of(context).textTheme.labelSmall,
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

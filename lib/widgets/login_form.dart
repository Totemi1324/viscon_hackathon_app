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

  void _onSignInPressed(BuildContext buildContext) /*async*/ {
    setState(() {
      _isLoading = true;
    });

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
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
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
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
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
                )),
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

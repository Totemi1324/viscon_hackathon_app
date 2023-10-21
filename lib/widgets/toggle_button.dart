import 'package:flutter/material.dart';

class ToggleButton extends StatefulWidget {
  final String title;
  final Function(String, bool) valueCallback;

  const ToggleButton(this.title, {required this.valueCallback, super.key});

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _toggled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _toggled = !_toggled;
        });
        widget.valueCallback(widget.title, _toggled);
      },
      child: Container(
        decoration: BoxDecoration(
          color: _toggled
              ? Theme.of(context).colorScheme.tertiary
              : Colors.transparent,
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _toggled
                  ? Theme.of(context).colorScheme.onTertiary
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

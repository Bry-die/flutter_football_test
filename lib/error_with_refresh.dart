import 'package:flutter/material.dart';

class ErrorRefresh extends StatelessWidget {
  const ErrorRefresh({
    Key? key,
    required this.onPressed,
    required this.errorText,
  }) : super(key: key);

  final void Function() onPressed;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(errorText),
          const SizedBox(height: 10.0),
          const Icon(Icons.refresh),
        ],
      ),
    );
  }
}

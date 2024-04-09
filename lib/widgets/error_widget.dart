import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.error,
  });
  final String error;

  @override
  Widget build(BuildContext context) => Center(child: Text(error));
}

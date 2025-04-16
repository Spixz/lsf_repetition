import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  const CenteredMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(message),
    ));
  }
}

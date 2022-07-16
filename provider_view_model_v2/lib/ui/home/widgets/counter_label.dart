import 'package:flutter/material.dart';

class CounterLabel extends StatelessWidget {
  final int value;
  final bool isBusy;
  const CounterLabel({
    Key? key,
    required this.value,
    required this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isBusy ? 0 : 1,
          child: Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned.fill(
          child: Visibility(
            visible: isBusy,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}

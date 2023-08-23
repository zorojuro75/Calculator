import 'package:flutter/material.dart';
class key extends StatefulWidget {
  const key({super.key});

  @override
  State<key> createState() => _keyState();
}

class _keyState extends State<key> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap('1'),
      child: const Text(
        '1',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    ),;
  }
}

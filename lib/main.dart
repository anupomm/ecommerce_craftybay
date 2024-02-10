import 'package:flutter/material.dart';

import 'application/app.dart';

void main() {
  runApp(const CraftyBay());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CraftyBay',
    );
  }
}

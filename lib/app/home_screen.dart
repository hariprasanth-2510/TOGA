import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TOGA')),
      body: const Center(
        child: Text(
          'TOGA\nArchitecture configured.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

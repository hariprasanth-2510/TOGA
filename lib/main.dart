import 'package:flutter/material.dart';

void main() {
  runApp(const TogaApp());
}

class TogaApp extends StatelessWidget {
  const TogaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOGA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TOGA'),
      ),
      body: const Center(
        child: Text(
          'TOGA\nInitial project',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

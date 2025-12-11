import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';
import 'layouts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CalculatorProvider(),
      child: const CalculatorApp(),
    ),
  );
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isPortrait ? 420 : 680,
            maxHeight: isPortrait ? 680 : 420,
          ),
          child: isPortrait ? const PortraitLayout() : const LandscapeLayout(),
        ),
      ),
    );
  }
}

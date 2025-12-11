import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';
import 'widgets/keypad.dart';
import 'widgets/history_panel.dart';

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 1, child: DisplayArea()),
        Expanded(flex: 5, child: Keypad()),
        Expanded(flex: 1, child: HistoryPanel()),
      ],
    );
  }
}

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(flex: 2, child: DisplayArea()),
        Expanded(flex: 3, child: Keypad()),
        Expanded(flex: 2, child: HistoryPanel()),
      ],
    );
  }
}

class DisplayArea extends StatelessWidget {
  const DisplayArea({super.key});

  @override
  Widget build(BuildContext context) {
    final display = context.watch<CalculatorProvider>().displayValue;

    return Container(
      padding: const EdgeInsets.all(24),
      alignment: Alignment.bottomRight,
      color: Colors.black,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          display,
          style: const TextStyle(
            fontSize: 56,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../calculator_provider.dart';

class Keypad extends StatelessWidget {
  const Keypad({super.key});

  @override
  Widget build(BuildContext context) {
    final cp = context.read<CalculatorProvider>();

    final keys = [
      ['AC', 'CE', 'clr', '÷'],
      ['7', '8', '9', '×'],
      ['4', '5', '6', '-'],
      ['1', '2', '3', '+'],
      ['', '', '.', '%'],
      ['(', '0', ')', '='],
    ];

    Widget buildButton(String label) {
      return SizedBox(
        width: 64,
        height: 64,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                _isOperator(label) ? Colors.orange : Colors.grey.shade900,
            foregroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          onPressed: () {
            switch (label) {
              case 'AC':
                cp.clearAll();
                break;
              case 'CE':
                cp.clearEntry();
                break;
              case 'clr':
                cp.backspace();
                break;
              case '=':
                cp.evaluate();
                break;
              default:
                cp.input(label);
            }
          },
          child: Text(label, style: const TextStyle(fontSize: 24)),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 4,
      childAspectRatio: 1,
      children: [
        for (var row in keys)
          for (var key in row) buildButton(key),
      ],
    );
  }

  bool _isOperator(String x) => ['+', '-', '×', '÷', '%'].contains(x);
}

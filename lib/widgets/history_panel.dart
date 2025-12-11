import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../calculator_provider.dart';

class HistoryPanel extends StatelessWidget {
  const HistoryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final history = context.watch<CalculatorProvider>().history;
    final cp = context.read<CalculatorProvider>();

    return Container(
      color: Colors.grey.shade900,
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, i) {
          final item = history[i];
          return ListTile(
            title: Text(
              '${item.expression} = ${item.result}',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '-- ${item.timestamp}',
              style: TextStyle(color: Colors.grey.shade400),
            ),
            onTap: () {
              // cp.setExpressionForTest(item.expression);
            },
          );
        },
      ),
    );
  }
}

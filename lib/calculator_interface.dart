import 'package:meta/meta.dart';

@immutable
class CalcHistoryItem {
  final String expression;
  final String result;
  final DateTime timestamp;

  const CalcHistoryItem({
    required this.expression,
    required this.result,
    required this.timestamp,
  });
}

@sealed
abstract class CalculatorModel {
  String get expression;
  String get displayValue;
  List<CalcHistoryItem> get history;

  void input(String value);
  void backspace();
  void clearEntry();
  void clearAll();
  void evaluate();

  @visibleForTesting
  void setExpressionForTest(String exp);
}

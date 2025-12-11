import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'calculator_interface.dart';

class CalculatorProvider extends ChangeNotifier implements CalculatorModel {
  String _expression = '';
  String _displayValue = '0';
  final List<CalcHistoryItem> _history = [];

  @override
  String get expression => _expression;

  @override
  String get displayValue => _displayValue;

  @override
  List<CalcHistoryItem> get history => List.unmodifiable(_history);

  bool _isOperator(String v) => ['+', '-', '×', '÷', '%'].contains(v);

  String _normalize(String exp) =>
      exp.replaceAll('×', '*').replaceAll('÷', '/');

  @override
  void input(String value) {
    if (_isOperator(value) &&
        (_expression.isEmpty || _isOperator(_expression.characters.last))) {
      return;
    }

    _expression += value;
    _displayValue = _expression;
    notifyListeners();
  }

  @override
  void backspace() {
    if (_expression.isNotEmpty) {
      _expression = _expression.substring(0, _expression.length - 1);
      _displayValue = _expression.isEmpty ? '0' : _expression;
      notifyListeners();
    }
  }

  @override
  void clearEntry() {
    _expression = '';
    _displayValue = '0';
    notifyListeners();
  }

  @override
  void clearAll() {
    clearEntry();
    _history.clear();
    notifyListeners();
  }

  @override
  void clearAll() {
    clearEntry();
    _history.clear();
    notifyListeners();
  }

  @override
  void evaluate() {
    if (_expression.isEmpty) return;

    try {
      final parser = Parser();
      final parsed = parser.parse(_normalize(_expression));
      final result = parsed.evaluate(EvaluationType.REAL, ContextModel());

      final resStr = result.toString();
      _history.insert(
        0,
        CalcHistoryItem(
          expression: _expression,
          result: resStr,
          timestamp: DateTime.now(),
        ),
      );

      _expression = resStr;
      _displayValue = resStr;
    } catch (_) {
      _displayValue = 'Error';
    }

    notifyListeners();
  }

  @override
  void setExpressionForTest(String exp) {
    _expression = exp;
    _displayValue = exp;
  }
}

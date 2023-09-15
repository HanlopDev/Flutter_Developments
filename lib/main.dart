import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    debugShowCheckedModeBanner: false,
    home: const Expsenses(),
  ),
  );
}
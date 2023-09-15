import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

class Expsenses extends StatefulWidget {
  const Expsenses({super.key});

  @override
  State<Expsenses> createState() {
    
    return _ExpsensesState();
  }
  
}

class _ExpsensesState extends State<Expsenses> {
  final List<Expense> _registerdExpenses = [
    Expense(title: "Flutter Course", 
    amount: 9.99, date: DateTime.now(), 
    category: Category.work,
    ),

    Expense(title: "Cinema", 
    amount: 16.2, date: DateTime.now(), 
    category: Category.leisure,
    ),
  ];

void _openAddExpensesOverlay() {
  showModalBottomSheet(context: context,
   builder: (ctx) => const NewExpense());
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expenses Tracker"),
        actions: [
        IconButton(onPressed: _openAddExpensesOverlay,
         icon: const Icon(Icons.add))
      ],),
      body: Column(children: [
      const Text("Chart"),
      Expanded(child: ExpenseList(expenses: _registerdExpenses))
    ],),);
  }
}
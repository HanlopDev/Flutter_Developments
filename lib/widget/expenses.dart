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
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
   builder: (ctx) =>  NewExpense(onAddExpense: _addExpense));
}

void _addExpense(Expense expense) {
  setState(() {
    _registerdExpenses.add(expense);
  });
}

void _removeExpense(Expense expense) {
  final expenseIndex = _registerdExpenses.indexOf(expense);
  setState(() {
    _registerdExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense Deleted'),
      action: SnackBarAction(label: "Undo", 
      onPressed: () {
        setState(() {
          _registerdExpenses.insert(expenseIndex, expense);
        });
      }),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found, Start adding some!"),
    );

    if (_registerdExpenses.isNotEmpty) {
      mainContent = ExpenseList(expenses: _registerdExpenses, 
      onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expenses Tracker"),
        actions: [
        IconButton(onPressed: _openAddExpensesOverlay,
         icon: const Icon(Icons.add),
         ),
        ],
      ),
      body: Column(children: [
      const Text("Chart"),
      Expanded(child: mainContent,
      )
    ],
    ),
    );
  }
}
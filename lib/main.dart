import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'widgets/input.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
            .copyWith(secondary: Colors.amberAccent),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> userTransactions = [];
  int txId = 0;

  List<Transaction> get _recentTransactions {
    return userTransactions.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );
    setState(() {
      userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return Input(_addNewTransaction);
      },
    );
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Chart(_recentTransactions),
            TransactionList(userTransactions, deleteTransaction),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTransaction(context),
        child: Icon(
          Icons.new_label_rounded,
          size: 35,
        ),
      ),
    );
  }
}

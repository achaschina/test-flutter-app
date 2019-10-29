import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './widgets/transactionList.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'Quicksand'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final now = DateTime.now();
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New shoes..', amount: 123.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Weekly Groceries',
        amount: 69.99,
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 1)),
    Transaction(
        id: 't3',
        title: 'New dress',
        amount: 59.99,
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 2)),
    Transaction(
        id: 't4',
        title: 'Cinema',
        amount: 15,
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 3)),
    Transaction(
        id: 't4',
        title: 'Theatre',
        amount: 25.65,
        date: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day - 4)),
    // date: DateTime.now(),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: selectedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Personal Expenses',
              style: TextStyle(fontFamily: 'Open Sans')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Chart(_recentTransactions),
              TransactionList(_userTransactions)
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          // backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}

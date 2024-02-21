import 'package:expense_tracker/bar_graph/bargraph.dart';
import 'package:expense_tracker/model/transaction.dart';
import 'package:expense_tracker/widget/new_transaction.dart';
import 'package:expense_tracker/widget/transaction_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // transaction list...
  final List<Transaction> transactions = weeklySummary;

  // method for new transaction addition.
  void addNewTransaction(String txTitle, int txAmount) {
    final newtx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(
      () {
        transactions.add(newtx);
      },
    );
  }

  void startNewTransaction(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addNewTransaction);
        });
  }

  List weeklySummary = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                height: 400,
                child: Grpah(
                  weeklySummary: weeklySummary,
                ),
              ),
            ),
            TransactionLIst(transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

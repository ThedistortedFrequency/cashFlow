import 'package:expense_tracker/model/transaction.dart';
import 'package:expense_tracker/widget/new_transaction.dart';
import 'package:expense_tracker/widget/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  // transaction list...
  final List<Transaction> transactions = [
    Transaction(
      id: "id",
      title: "title",
      amount: 22,
      date: DateTime.now(),
    ),
  ];

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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NewTransaction(addNewTransaction),
        TransactionLIst(transactions),
      ],
    );
  }
}

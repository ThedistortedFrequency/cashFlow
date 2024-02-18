import 'package:expense_tracker/widget/user_transaction.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}

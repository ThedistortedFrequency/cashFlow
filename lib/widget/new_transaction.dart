import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction(this.addTx, {super.key});

  final Function addTx;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // submid data method
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = int.parse(amountController.text);

    // validation for empty data and invalid amount..
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(label: Text("Title")),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(label: Text("amount")),
              controller: amountController,
              onSubmitted: (value) => submitData(),
            ),
            TextButton(
                onPressed: submitData, child: const Text("Add Transaction"))
          ],
        ),
      ),
    );
  }
}

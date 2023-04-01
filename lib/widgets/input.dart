import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  final Function addTx;

  Input(this.addTx);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate;

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Title',
                ),
                controller: titleController,
                onSubmitted: (_) => submitData()),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Amount Spent',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat('MMM dd yyyy | ').format(_selectedDate)}',
                    ),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => submitData(),
              child: Text(
                'Add Transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}

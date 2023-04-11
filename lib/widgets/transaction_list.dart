import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transactions Added",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 450,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return TxCard(
                    txId: transactions[index].id,
                    txAmount: transactions[index].amount,
                    txTitle: transactions[index].title,
                    txTime: transactions[index].date,
                    delTx: deleteTransaction);
              },
              itemCount: transactions.length,
            ),
    );
  }
}

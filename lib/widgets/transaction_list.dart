import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transactionCard.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Container(
        child: transactions.isEmpty
            ? Column(
                children: [
                  Container(
                    height: constraints.maxHeight * 0.09,
                    child: Text(
                      "No Transactions Added",
                      style: TextStyle(
                          fontSize:
                              20 * MediaQuery.of(context).textScaleFactor),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.03,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.8,
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
    });
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TxCard extends StatelessWidget {
  final String txId;
  final double txAmount;
  final String txTitle;
  final DateTime txTime;
  final Function delTx;

  TxCard({
    this.txId,
    this.txAmount,
    this.txTime,
    this.txTitle,
    this.delTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            color: Theme.of(context).primaryColorLight,
            child: Container(
              height: 45,
              width: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '₹${txAmount.toStringAsFixed(0)}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Theme.of(context).primaryColorLight,
            child: Container(
              height: 45,
              width: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        txTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('MMM dd yyyy  | ').add_jm().format(txTime),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              delTx(txId);
            },
            icon: Icon(Icons.delete),
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}

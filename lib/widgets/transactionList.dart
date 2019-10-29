import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 300,
                    child: Image.asset(
                      'assets/img/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return Card(
                  margin: EdgeInsets.all(15),
                  elevation: 6,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text(
                                '\$${transactions[i].amount.toStringAsFixed(2)}')),
                      ),
                    ),
                    title: Text(
                      transactions[i].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle:
                        Text(DateFormat.yMMMd().format(transactions[i].date)),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         width: 115,
                //         margin:
                //             EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).primaryColorDark,
                //           width: 2,
                //         )),
                //         padding: EdgeInsets.all(5),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: <Widget>[
                //             Text(
                //               '\$${transactions[i].amount.toStringAsFixed(2)}',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 20,
                //                 color: Theme.of(context).primaryColorDark,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: <Widget>[
                //           Text(
                //             transactions[i].title,
                //             style: TextStyle(
                //                 fontSize: 16, fontWeight: FontWeight.bold),
                //           ),
                //           Container(
                //             margin: EdgeInsets.only(top: 10),
                //             child: Text(
                //               DateFormat.yMMMd().format(transactions[i].date),
                //               style:
                //                   TextStyle(color: Colors.grey, fontSize: 10),
                //             ),
                //           ),
                //         ],
                //       )
                //     ],
                //   ),
                //   elevation: 5,
                // );
              },
              itemCount: transactions.length),
    );
  }
}

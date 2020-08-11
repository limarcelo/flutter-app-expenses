import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Nenhuma Transação Cadastrada!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat('d-MM-y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 480
                      ? FlatButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete),
                          label: Text('Excluir'),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
              // return Card(
              //   elevation: 5,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 120,
              //         margin:
              //             EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              //         decoration: BoxDecoration(
              //             border: Border.all(
              //           color: Colors.purple[50],
              //           width: 2,
              //         )),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           'R\$ ${tr.value.toStringAsFixed(2).replaceAll('.', ',')}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.symmetric(vertical: 10),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               tr.title,
              //               style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16,
              //               ),
              //             ),
              //             Text(
              //               DateFormat('d/MM/y').format(tr.date),
              //               style: TextStyle(
              //                 color: Colors.grey[600],
              //                 fontSize: 16,
              //               ),
              //             ),
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // );
            },
          );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';


class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

@override
  void initState() {
    // TODO: implement initState
  const availableColors=[
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.purple,
  ];

  _bgColor=availableColors[Random().nextInt(4)];  //maximum number is not included and numbering starts from zero
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: _bgColor,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
                child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed:(){widget.deleteTransaction(widget.transaction.id);} ,
        ),
      ),
    );
  }
}
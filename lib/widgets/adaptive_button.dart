import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveButton extends StatelessWidget {

  final String text;
  final Function handler;

  AdaptiveButton(this.text,this.handler);


  @override
  Widget build(BuildContext context) {
    return  Platform.isIOS
        ? CupertinoButton(
        onPressed: handler,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ))
        : FlatButton(
        textColor: Theme.of(context).primaryColor,
        onPressed: handler,
        child: Text(
          'Choose Date',
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}

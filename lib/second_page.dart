import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final int column;
  final int row;

  SecondPage({this.column, this.row});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int x;
  int y;

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        x = Random().nextInt(widget.column);
        y = Random().nextInt(widget.row);
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: Flex(
              direction: Axis.horizontal,
              children: getColumnWidgets(widget.column),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getColumnWidgets(int columns) {
    return List<Widget>.generate(
      columns,
      (i) => Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: x == i ? Colors.orange : Colors.transparent, width: 3),
          ),
          child: Column(
            children: getRowWidgets(i, widget.row),
          ),
        ),
      ),
    );
  }

  List<Widget> getRowWidgets(int columnIndex, int rows) {
    return List<Widget>.generate(rows + 1, (i) {
      if (i != rows) {
        return Expanded(
          flex: 1,
          child: Container(
            child: columnIndex == x && i == y
                ? FittedBox(child: Text("random"))
                : Container(),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          ),
        );
      } else {
        return Expanded(
          flex: 1,
          child: MaterialButton(
            padding: EdgeInsets.all(0),
            color: Colors.blue,
            child: Text(
              '確定',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                x = null;
                y = null;
              });
            },
          ),
        );
      }
    });
  }
}

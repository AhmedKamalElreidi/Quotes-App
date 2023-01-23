// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final String mytitle;
  final String myauthor;
  final Function deleteTask;
  final BestQuote item;

  const CardWidget(
      {Key? key,
      required this.mytitle,
      required this.deleteTask,
      required this.item,
      required this.myauthor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 57, 66, 151),
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Container(
        padding: EdgeInsets.all(11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              mytitle,
              style: TextStyle(fontSize: 27, color: Colors.white),
              textDirection: TextDirection.rtl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    deleteTask(item);
                  },
                  icon: Icon(Icons.delete),
                  iconSize: 30,
                  color: Color.fromARGB(255, 209, 198, 209),
                ),
                Text(
                  myauthor,
                  style: TextStyle(fontSize: 27, color: Colors.white),
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

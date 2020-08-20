import './transcation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(List<String> args) {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction1 = [
    Transaction(
      id: 't1',
      title: 'Shoes',
      amount: 55.69,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Shirt',
      amount: 45.69,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personal Expences Record'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text(
                  'Chart',
                  textAlign: TextAlign.center,
                ),
                color: Colors.blue,
                elevation: 10,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      cursorColor: Colors.black,
                      cursorWidth: 2,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      cursorColor: Colors.black,
                      cursorWidth: 2,
                    ),
                    FlatButton(
                      color: Colors.blueAccent,
                      child: Text(
                        'Add Transcation',
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: transaction1.map(
                  (ts) {
                    return Card(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              '\$' + ts.amount.toString(),
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  ts.title,
                                  style: TextStyle(
                                    backgroundColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat('dd-MM-yyyy').format(ts.date),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

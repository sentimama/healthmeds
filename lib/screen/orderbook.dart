import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderBook extends StatefulWidget {
  @override
  _OrderBookState createState() => _OrderBookState();
}

class _OrderBookState extends State<OrderBook> {
  int a;
  int b;
  List product = [];
  String userid;
  var j;

  @override
  Widget build(BuildContext context) {
    a = product.length;
    b = a - 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Order Book'),
      ),
      body: FutureBuilder(
        future: _fetch(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Text("Loading data...Please wait");
          return ListView(
            children: [
              for (j = 0; j <= b; j++)
                ListTile(
                  title: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.only(
                      left: 10,
                      top: 10,
                    ),
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[900]),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Text(
                      "${product[j]}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green[900],
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('Order')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        product = ds.data()['Product'];
      });
  }
}

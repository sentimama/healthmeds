import 'package:app/provider/my_provider.dart';

import 'package:app/screen/success.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  

  Widget cartItem({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 5,
          left: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.green,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "\Rs $price",
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 18,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\Quantity: $quantity",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.green[800]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildButton(){
  //   return Column(
  //     children: userlist.map((e) {

  //     }).toList()
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    MyProvider provider = Provider.of<MyProvider>(context);

    int total = provider.totalprice();
    int index;

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 5),
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.green,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\Total Price: Rs $total",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            TextButton(
              onPressed: () {
                if (provider.cartList.isNotEmpty) {
                  FirebaseFirestore.instance
                      .collection("Order")
                      .doc(user.uid)
                      .set({
                    "Product": provider.cartList
                        .map((c) => {
                              "Product Name": c.name,
                              "Product Price": c.price,
                              "Product Quantity": c.quantity,
                            })
                        .toList(),
                    "Total Price": total,
                    "UserID": user.uid,
                  });
                  provider.clearCart();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Success()));
                }
              },
              child: Text(
                "Place Order",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HealthMeds'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, myIndex) {
          index = myIndex;
          return cartItem(
            image: provider.cartList[myIndex].image,
            name: provider.cartList[myIndex].name,
            price: provider.cartList[myIndex].price,
            quantity: provider.cartList[myIndex].quantity,
          );
        },
      ),
    );
  }
}

import 'package:app/provider/my_provider.dart';
import 'package:app/screen/checkout.dart';
import 'package:app/screen/error_checkout.dart';
import 'package:app/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Widget cartItem({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
    @required Function onTap,
  }) {
    return Container(
      padding: EdgeInsets.only(top:10,left:5,right:5),
          child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 5,
        ),
        decoration: BoxDecoration(
          border: Border.all(color:Colors.green,width:2),
          borderRadius: BorderRadius.circular(30),

        ),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              width: 20,
            ),
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
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "\Rs $price",
                          style: TextStyle(
                            color: Colors.green[800],
                            fontSize: 22,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "\Quantity: $quantity",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.green[800]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.6),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 15,
                      ),
                      onPressed: onTap,
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

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();

    void check() {
      if (total == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckError()));
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Checkout()));
      }
    }

    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 5),
        height: 70,
        decoration: BoxDecoration(
          
          color: Colors.lightGreen,
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
                check();
              },
              child: Text(
                "Check Out",
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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }, icon: Icon(Icons.home),iconSize: 28,),
        ],
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getDeleteIndex(index);
          return cartItem(
            onTap: () {
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}

import 'package:app/provider/my_provider.dart';
import 'package:app/screen/CartPage.dart';
import 'package:app/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailSalesPage extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final int oprice;
  final String discount;
  DetailSalesPage(
      {@required this.name,
      @required this.image,
      @required this.price,
      @required this.oprice,
      @required this.discount});

  @override
  _DetailSalesPageState createState() => _DetailSalesPageState();
}

class _DetailSalesPageState extends State<DetailSalesPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text('HealthMeds'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\Rs ${widget.price}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                    Text(
                      "(\Rs ${widget.oprice})",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[900],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.remove,
                                color: Colors.green[900],
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity--;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "$quantity",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[900],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.green,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                color: Colors.green[900],
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0,
                              offset: Offset(7, 0),
                              color: Colors.green.withOpacity(0.4),
                            ),
                          ]),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          provider.addToCart(
                              image: widget.image,
                              name: widget.name,
                              price: widget.price,
                              quantity: quantity);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CartPage()));
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.green[900],
                  height: 50,
                  thickness: 2,
                ),
                Text(
                  "Description",
                ),
                SizedBox(height: 10),
                Text("MEDICINE DESCRIPTION IN A PARAGRAPH")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

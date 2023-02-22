import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String myEmail;
  String name;
  String district;
  String city;
  String ward;
  String street;
  String contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Profile'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            return Container(
              padding: EdgeInsets.only(
                top: 50,
                left: 5,
                right: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "Name : $name",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "Email : $myEmail",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "District : $district",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "City : $city",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "Ward Number : $ward",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "Street : $street",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color:Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10),),
                    ),
                    child: Center(
                      child: Text(
                        "Contact Number : $contact",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        name = ds.data()['name'];
        myEmail = ds.data()['email'];
        district = ds.data()['district'];
        city = ds.data()['city'];
        ward = ds.data()['ward'];
        street = ds.data()['street'];
        contact = ds.data()['contact'];
      }).catchError((e) {
        print(e);
      });
  }
}

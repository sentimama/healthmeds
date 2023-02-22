import 'package:app/screen/homepage.dart';
import 'package:flutter/material.dart';

class CheckError extends StatefulWidget {
  @override
  _CheckErrorState createState() => _CheckErrorState();
}

class _CheckErrorState extends State<CheckError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Healthmeds"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Please select medicines to checkout",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(Radius.circular(30),),
              ),
              child: TextButton(
                child: Text("Back to homepage",style: TextStyle(color: Colors.white,fontSize: 18,),),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app/screen/login_page.dart';

class SignupPage extends StatefulWidget {
  //notepad.pw/Pattern
  static Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  UserCredential userCredential;
  RegExp regExp = RegExp(SignupPage.pattern);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confrim = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController ward = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController contact = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Account registered",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
            ),
          ),
        ),
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user.uid)
          .set({
        'name': name.text.trim(),
        'email': email.text.trim(),
        'userid': userCredential.user.uid,
        'password': password.text.trim(),
        'confirm': confrim.text.trim(),
        'district': district.text.trim(),
        'city': city.text.trim(),
        'ward': ward.text.trim(),
        'street': street.text.trim(),
        'contact': contact.text.trim(),
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "The password provided is too weak.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "The account already exists for that email.",
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e),
        ),
      );
    }
  }

  void validation() {
    if (name.text.trim().isEmpty || name.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Name is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Email is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Password is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Email is invalid",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (confrim.text.trim().isEmpty || confrim.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Password is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (district.text.trim().isEmpty || district.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "District Section is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (city.text.trim().isEmpty || city.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "City Section is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (ward.text.trim().isEmpty || ward.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Ward Section is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (street.text.trim().isEmpty || street.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Street Section is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (contact.text.trim().isEmpty || contact.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Contact Section is Empty",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    }
    if (password.text.trim() != confrim.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Passwords do not match",
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      );
      return;
    } else {
      sendData();
    }
  }

  Widget textField(
      {@required String hintText,
      @required bool obscureText,
      @required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black54,
            width: 3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.redAccent),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/welcome.png",
                ),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.redAccent),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                textField(
                  hintText: "Name",
                  obscureText: false,
                  controller: name,
                ),
                SizedBox(
                  height: 20,
                ),
                textField(
                  controller: email,
                  hintText: "Email",
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                textField(
                  controller: password,
                  hintText: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                textField(
                  controller: confrim,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  controller: district,
                  hintText: "District",
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  controller: city,
                  hintText: "City",
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  controller: ward,
                  hintText: "Ward No.",
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  controller: street,
                  hintText: "Street Name",
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                textField(
                  controller: contact,
                  hintText: "Contact Number",
                  obscureText: false,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      validation();
                      CircularProgressIndicator();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

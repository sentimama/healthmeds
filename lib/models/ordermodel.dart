import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
   int total;
   List product;
   String userid;

  OrderModel.fromMap(Map<String,dynamic> data){
    total=data["Total Price"];
    product=data["Product"];
    userid=data["UserID"];
  }
}

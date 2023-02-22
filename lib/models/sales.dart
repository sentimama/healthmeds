import 'package:flutter/cupertino.dart';

class SalesModel {
  final String name;
  final String image;
  final int price;
  final int oprice;
  final String discount;
  SalesModel(
      {@required this.name,
      @required this.image,
      @required this.price,
      @required this.oprice,
      @required this.discount});
}

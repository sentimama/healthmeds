import 'package:flutter/cupertino.dart';

class SearchModel {
  final String name;
  final String image;
  final int price;
  final String unit;
  final String weight;
  final String description;

  SearchModel(
      {@required this.name, @required this.image, @required this.price,@required this.unit,@required this.weight,@required this.description});
}

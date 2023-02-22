import 'package:app/models/medicines_model.dart';
import 'package:app/models/searchmodel.dart';
import 'package:app/provider/my_provider.dart';
import 'package:app/screen/bottom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'detailpage.dart';

class Search extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   
    MyProvider provider = Provider.of(context);
    List<MedicinesModel> searchProduct = provider.searchDataList(query);
    return GridView.count(
      childAspectRatio: 0.8,
      crossAxisCount: 2,
      crossAxisSpacing: 5,
      mainAxisSpacing: 10,
      children: searchProduct
          .map((e) => BottomContainer(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DetailPage(
                        name: e.name,
                        image: e.image,
                        price: e.price,
                        unit: e.unit,
                        weight: e.weight,
                        description: e.description,
                      )));
              },
              name: e.name,
              image: e.image,
              price: e.price,
              unit: e.unit,
              weight: e.weight,
              description: e.description))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Search Medicines",
          style: TextStyle(
            fontSize: 20,
            color: Colors.green[900],
          ),
        ),
      ),
    );
  }
}

import 'package:app/models/medicines_model.dart';
import 'package:flutter/material.dart';
import 'package:app/screen/bottom_container.dart';

import 'detailpage.dart';

class Medicines extends StatelessWidget {
  List<MedicinesModel> list = [];
  Medicines({@required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HealthMeds'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.55,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: list
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
                    description: e.description,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

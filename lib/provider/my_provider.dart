import 'dart:collection';

import 'package:app/models/cart_model.dart';
import 'package:app/models/categories_model.dart';
import 'package:app/models/ProfileModel.dart';
import 'package:app/models/ordermodel.dart';
import 'package:app/models/searchmodel.dart';
import 'package:app/models/userModel.dart';
import 'package:app/screen/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/models/sales.dart';
import 'package:app/models/medicines_model.dart';

class MyProvider extends ChangeNotifier {

  List<CategoriesModel> antipyreticsList = [];
  CategoriesModel antipyreticsModel;

  Future<void> getAntipyretics() async {
    List<CategoriesModel> newantipyreticsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('antipyretics')
        .get();
    querySnapshot.docs.forEach((element) {
      antipyreticsModel = CategoriesModel(
        name: element.data()['name'],
      );
      // print(antipyreticsModel.name);
      newantipyreticsList.add(antipyreticsModel);
      antipyreticsList = newantipyreticsList;
    });
    notifyListeners();
  }

  get throwAntipyreticsList {
    return antipyreticsList;
  }

  /////////2nd//////////////////
  List<CategoriesModel> analgesicsList = [];
  CategoriesModel analgesicsModel;

  Future<void> getAnalgesics() async {
    List<CategoriesModel> newanalgesicsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('analgesics')
        .get();
    querySnapshot.docs.forEach((element) {
      analgesicsModel = CategoriesModel(
        name: element.data()['name'],
      );
      // print(analgesicsModel.name);
      newanalgesicsList.add(analgesicsModel);
      analgesicsList = newanalgesicsList;
    });
    notifyListeners();
  }

  get throwAnalgesicsList {
    return analgesicsList;
  }

  //////3rd//////////////
  List<CategoriesModel> antibioticsList = [];
  CategoriesModel antibioticsModel;

  Future<void> getAntibiotics() async {
    List<CategoriesModel> newantibioticsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('antibiotics')
        .get();
    querySnapshot.docs.forEach((element) {
      antibioticsModel = CategoriesModel(
        name: element.data()['name'],
      );
      // print(antibioticsModel.name);
      newantibioticsList.add(antibioticsModel);
      antibioticsList = newantibioticsList;
    });
    notifyListeners();
  }

  get throwAntibioticsList {
    return antibioticsList;
  }

  ///////4th/////////////
  List<CategoriesModel> antimalarialList = [];
  CategoriesModel antimalarialModel;

  Future<void> getAntimalarial() async {
    List<CategoriesModel> newantimalarialList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('antimalarial')
        .get();
    querySnapshot.docs.forEach((element) {
      antimalarialModel = CategoriesModel(
        name: element.data()['name'],
      );
      // print(antimalarialModel.name);
      newantimalarialList.add(antimalarialModel);
      antimalarialList = newantimalarialList;
    });
    notifyListeners();
  }

  get throwAntimalarialList {
    return antimalarialList;
  }

  ///////5th////////////
  List<CategoriesModel> antisepticsList = [];
  CategoriesModel antisepticsModel;

  Future<void> getAntiseptics() async {
    List<CategoriesModel> newantisepticsList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('antiseptics')
        .get();
    querySnapshot.docs.forEach((element) {
      antisepticsModel = CategoriesModel(
        name: element.data()['name'],
      );
      // print(antisepticsModel.name);
      newantisepticsList.add(antisepticsModel);
      antisepticsList = newantisepticsList;
    });
    notifyListeners();
  }

  get throwAntisepticsList {
    return antisepticsList;
  }

  /////////6th/////////
  List<CategoriesModel> moodList = [];
  CategoriesModel moodModel;

  Future<void> getMood() async {
    List<CategoriesModel> newmoodList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('mood_stabilizers')
        .get();
    querySnapshot.docs.forEach((element) {
      moodModel = CategoriesModel(
        name: element.data()['name'],
      );
      //print(moodModel.name);
      newmoodList.add(moodModel);
      moodList = newmoodList;
    });
    notifyListeners();
  }

  get throwMoodList {
    return moodList;
  }

  ///////////7th///////
  List<CategoriesModel> hormoneList = [];
  CategoriesModel hormoneModel;

  Future<void> getHormone() async {
    List<CategoriesModel> newhormoneList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('hormone_replacement')
        .get();
    querySnapshot.docs.forEach((element) {
      hormoneModel = CategoriesModel(
        name: element.data()['name'],
      );
      //print(hormoneModel.name);
      newhormoneList.add(hormoneModel);
      hormoneList = newhormoneList;
    });
    notifyListeners();
  }

  get throwHormoneList {
    return hormoneList;
  }

  ///////////////8th///
  List<CategoriesModel> oralList = [];
  CategoriesModel oralModel;

  Future<void> getOral() async {
    List<CategoriesModel> neworalList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('MIw2b3NgcQvzRjee0Jt7')
        .collection('oral_contraceptives')
        .get();
    querySnapshot.docs.forEach((element) {
      oralModel = CategoriesModel(
        name: element.data()['name'],
      );
      //print(oralModel.name);
      neworalList.add(oralModel);
      oralList = neworalList;
    });
    notifyListeners();
  }

  get throwOralList {
    return oralList;
  }

  ///////////////Sales Medicine///////////
  List<SalesModel> salesList = [];
  SalesModel salesModel;

  Future<void> getsales() async {
    List<SalesModel> newSalesList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('sales').get();
    querySnapshot.docs.forEach((element) {
      salesModel = SalesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        oprice: element.data()['oprice'],
        discount: element.data()['discount'],
      );

      newSalesList.add(salesModel);
      salesList = newSalesList;
    });
    notifyListeners();
  }

  get throwSalesList {
    return salesList;
  }

  /////////////Antipyretics//////////////
  List<MedicinesModel> antipyreticsCategoryList = [];
  MedicinesModel antipyreticsCategoryModel;

  Future<void> getAntipyreticsCategory() async {
    List<MedicinesModel> newantipyreticsCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('antipyretics')
        .get();
    querySnapshot.docs.forEach((element) {
      antipyreticsCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newantipyreticsCategoryList.add(antipyreticsCategoryModel);
      antipyreticsCategoryList = newantipyreticsCategoryList;
    });
    notifyListeners();
  }

  get throwantipyreticsCategoryList {
    return antipyreticsCategoryList;
  }

  //////////Analgesics//////////////
  List<MedicinesModel> analgesicsCategoryList = [];
  MedicinesModel analgesicsCategoryModel;

  Future<void> getAnalgesicsCategory() async {
    List<MedicinesModel> newanalgesicsCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('analgesics')
        .get();
    querySnapshot.docs.forEach((element) {
      analgesicsCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newanalgesicsCategoryList.add(analgesicsCategoryModel);
      analgesicsCategoryList = newanalgesicsCategoryList;
    });
    notifyListeners();
  }

  get throwanalgesicsCategoryList {
    return analgesicsCategoryList;
  }

  //////////Antibiotics//////////////
  List<MedicinesModel> antibioticsCategoryList = [];
  MedicinesModel antibioticsCategoryModel;

  Future<void> getAntibioticsCategory() async {
    List<MedicinesModel> newantibioticsCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('antibiotics')
        .get();
    querySnapshot.docs.forEach((element) {
      antibioticsCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newantibioticsCategoryList.add(antibioticsCategoryModel);
      antibioticsCategoryList = newantibioticsCategoryList;
    });
    notifyListeners();
  }

  get throwantibioticsCategoryList {
    return antibioticsCategoryList;
  }

  /////////////Antimalarial//////////////
  List<MedicinesModel> antimalarialCategoryList = [];
  MedicinesModel antimalarialCategoryModel;

  Future<void> getAntimalarialCategory() async {
    List<MedicinesModel> newantimalarialCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('antimalarial')
        .get();
    querySnapshot.docs.forEach((element) {
      antimalarialCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newantimalarialCategoryList.add(antimalarialCategoryModel);
      antimalarialCategoryList = newantimalarialCategoryList;
    });
    notifyListeners();
  }

  get throwantimalarialCategoryList {
    return antimalarialCategoryList;
  }

  /////////////Antiseptics//////////////
  List<MedicinesModel> antisepticsCategoryList = [];
  MedicinesModel antisepticsCategoryModel;

  Future<void> getAntisepticsCategory() async {
    List<MedicinesModel> newantisepticsCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('antiseptics')
        .get();
    querySnapshot.docs.forEach((element) {
      antisepticsCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newantisepticsCategoryList.add(antisepticsCategoryModel);
      antisepticsCategoryList = newantisepticsCategoryList;
    });
    notifyListeners();
  }

  get throwantisepticsCategoryList {
    return antisepticsCategoryList;
  }

  /////////////hormone replacement//////////////
  List<MedicinesModel> hormoneCategoryList = [];
  MedicinesModel hormoneCategoryModel;

  Future<void> getHormoneCategory() async {
    List<MedicinesModel> newhormoneCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('hormone')
        .get();
    querySnapshot.docs.forEach((element) {
      hormoneCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );
    
      newhormoneCategoryList.add(hormoneCategoryModel);
      hormoneCategoryList = newhormoneCategoryList;
    });
    notifyListeners();
  }

  get throwhormoneCategoryList {
    return hormoneCategoryList;
  }

  /////////////mood stabilizers//////////////
  List<MedicinesModel> moodCategoryList = [];
  MedicinesModel moodCategoryModel;

  Future<void> getMoodCategory() async {
    List<MedicinesModel> newmoodCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('medicines')
        .doc('xnZfnLJ351212hGi8Ur4')
        .collection('mood')
        .get();
    querySnapshot.docs.forEach((element) {
      moodCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );

      newmoodCategoryList.add(moodCategoryModel);
      moodCategoryList = newmoodCategoryList;
    });
    notifyListeners();
  }

  get throwmoodCategoryList {
    return moodCategoryList;
  }
  /////////////////////////////////////

  List<MedicinesModel> oralCategoryList = [];
  MedicinesModel oralCategoryModel;

  Future<void> getOralCategory() async {
    List<MedicinesModel> neworalCategoryList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('searchData')
        // .doc('xnZfnLJ351212hGi8Ur4')
        // .collection('oral')
        .get();
    querySnapshot.docs.forEach((element) {
      oralCategoryModel = MedicinesModel(
        name: element.data()['name'],
        image: element.data()['image'],
        price: element.data()['price'],
        unit: element.data()['unit'],
        weight: element.data()['weight'],
        description: element.data()['description'],
      );
      // print(oralCategoryModel.name);
      neworalCategoryList.add(oralCategoryModel);
      oralCategoryList = neworalCategoryList;
    });
    notifyListeners();
  }
  
  List<MedicinesModel> searchDataList(String query) {
    List<MedicinesModel> searchData = oralCategoryList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchData;
  }

  get throworalCategoryList {
    return oralCategoryList;
  }
  
  

  //////////////////////////Search///////////////////////////
  // List<SearchModel> searchList = [];
  // SearchModel searchModel;

  // Future<void> getSearch() async {
  //   List<SearchModel> newsearchList = [];
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //      .collection('searchData')
  //       .get();
  //   querySnapshot.docs.forEach((element) {
  //     searchModel = SearchModel(
  //       name: element.data()['name'],
  //       image: element.data()['image'],
  //       price: element.data()['price'],
  //       unit: element.data()['unit'],
  //       weight: element.data()['weight'],
  //       description: element.data()['description'],
  //     );
  //     print(searchModel.name);
  //     newsearchList.add(searchModel);
  //     searchList = newsearchList;
  //   });
  //   notifyListeners();
  // }
  
  // List<SearchModel> searchDataList(String query) {
  //   List<SearchModel> searchData = searchList.where((element) {
  //     return element.name.toUpperCase().contains(query) ||
  //         element.name.toLowerCase().contains(query);
  //   }).toList();
  //   return searchData;
  // }
  // get throwsearchList {
  //   return searchList;
  // }



  ///////////////CART////////////////
  List<CartModel> cartList = [];
  List<CartModel> newcartList = [];
  CartModel cartModel;
  void addToCart({
    @required String image,
    @required String name,
    @required int price,
    @required int quantity,
  }) {
    cartModel =
        CartModel(image: image, name: name, price: price, quantity: quantity);
    newcartList.add(cartModel);
    cartList = newcartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  int deleteIndex;
  void getDeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }

  void clearCart() {
    cartList.clear();
    notifyListeners();
  }
}

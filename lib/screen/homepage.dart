import 'package:app/models/categories_model.dart';
import 'package:app/models/searchmodel.dart';
import 'package:app/provider/my_provider.dart';
import 'package:app/screen/newCategories.dart';
import 'package:app/screen/orderbook.dart';
import 'package:app/screen/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/models/sales.dart';
import 'package:app/models/medicines_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/screen/welcome_page.dart';
import 'package:app/screen/CartPage.dart';
import 'package:app/screen/profile.dart';
import 'detailsales.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserCredential userCredential;

  Future<WelcomePage> _signOut() async {
    await FirebaseAuth.instance.signOut();
    return WelcomePage();
  }

  List<CategoriesModel> antipyreticsList = [];
  List<CategoriesModel> analgesicsList = [];
  List<CategoriesModel> antibioticsList = [];
  List<CategoriesModel> antimalarialList = [];
  List<CategoriesModel> antisepticsList = [];
  List<CategoriesModel> hormoneList = [];
  List<CategoriesModel> moodList = [];
  List<CategoriesModel> oralList = [];

  List<SalesModel> salesList = [];

  List<MedicinesModel> antipyreticsCategoryList = [];
  List<MedicinesModel> analgesicsCategoryList = [];
  List<MedicinesModel> antibioticsCategoryList = [];
  List<MedicinesModel> antisepticsCategoryList = [];
  List<MedicinesModel> antimalarialCategoryList = [];
  List<MedicinesModel> hormoneCategoryList = [];
  List<MedicinesModel> moodCategoryList = [];
  List<MedicinesModel> oralCategoryList = [];

  // List<SearchModel> searchList=[];

  Widget categoriesContainer({@required String name, @required onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottonContainer({
    @required String image,
    @required String name,
    @required int price,
    @required int oprice,
    @required String discount,
    @required Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 230,
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: Colors.red.withOpacity(0.7),
                    ),
                    child: Center(
                      child: Text(
                        discount,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(image),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.green[900],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "\Rs $price",
                            style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "\Rs $oprice",
                            style: TextStyle(
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget antipyretics() {
    return Row(
      children: antipyreticsList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: antipyreticsCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget analgesics() {
    return Row(
      children: analgesicsList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: analgesicsCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget antibiotics() {
    return Row(
      children: antibioticsList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: antibioticsCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget antimalarial() {
    return Row(
      children: antimalarialList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: antimalarialCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget antiseptics() {
    return Row(
      children: antisepticsList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: antisepticsCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget hormone() {
    return Row(
      children: hormoneList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: hormoneCategoryList)));
                },
              ))
          .toList(),
    );
  }

  Widget mood() {
    return Row(
      children: moodList
          .map((e) => categoriesContainer(
                name: e.name,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Medicines(list: moodCategoryList)));
                },
              ))
          .toList(),
    );
  }

  // Widget oral() {
  //   return Row(
  //     children: oralList
  //         .map((e) => categoriesContainer(
  //               name: e.name,
  //               onTap: () {
  //                 Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) =>
  //                             Medicines(list: oralCategoryList)));
  //               },
  //             ))
  //         .toList(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getAntipyretics();
    antipyreticsList = provider.throwAntipyreticsList;

    provider.getAnalgesics();
    analgesicsList = provider.throwAnalgesicsList;

    provider.getAntibiotics();
    antibioticsList = provider.throwAntibioticsList;

    provider.getAntimalarial();
    antimalarialList = provider.throwAntimalarialList;

    provider.getAntiseptics();
    antisepticsList = provider.throwAntisepticsList;

    provider.getHormone();
    hormoneList = provider.throwHormoneList;

    provider.getMood();
    moodList = provider.throwMoodList;

    provider.getOral();
    oralList = provider.throwOralList;

    provider.getsales();
    salesList = provider.throwSalesList;

    provider.getAntipyreticsCategory();
    antipyreticsCategoryList = provider.throwantipyreticsCategoryList;

    provider.getAnalgesicsCategory();
    analgesicsCategoryList = provider.throwanalgesicsCategoryList;

    provider.getAntibioticsCategory();
    antibioticsCategoryList = provider.throwantibioticsCategoryList;

    provider.getAntimalarialCategory();
    antimalarialCategoryList = provider.throwantimalarialCategoryList;

    provider.getAntisepticsCategory();
    antisepticsCategoryList = provider.throwantisepticsCategoryList;

    provider.getHormoneCategory();
    hormoneCategoryList = provider.throwhormoneCategoryList;

    provider.getMoodCategory();
    moodCategoryList = provider.throwmoodCategoryList;

    provider.getOralCategory();
    oralCategoryList = provider.throworalCategoryList;

    // provider.getSearch();
    // searchList=provider.throwsearchList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("HealthMeds"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: () {
              showSearch(context: context, delegate: Search());
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
            },
          ),
        ],
      ),
      drawer: Drawer(
          child: Container(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // UserAccountsDrawerHeader(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       fit: BoxFit.cover,
                //       image: AssetImage("assets/background.jpg"),
                //     ),
                //   ),
                //   currentAccountPicture: CircleAvatar(
                //     backgroundImage: AssetImage(
                //       "assets/login.png",
                //     ),
                //   ),
                //   accountName: Text(
                //     "Anish Paudyal",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                //   accountEmail: Text(
                //     "anish1796paudyal@gmail.com",
                //     style: TextStyle(
                //       color: Colors.white,
                //     ),
                //   ),
                // ),
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  title: TextButton(
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.book_outlined,
                    color: Colors.black,
                  ),
                  title: TextButton(
                    child: Text(
                      "Order Book",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OrderBook()));
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  title: TextButton(
                    child: Text(
                      "Logout",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      _signOut();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                antipyretics(),
                analgesics(),
                antibiotics(),
                antimalarial(),
                antiseptics(),
                hormone(),
                mood(),
                // oral(),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 510,
            child: GridView.count(
                shrinkWrap: false,
                primary: false,
                crossAxisCount: 2,
                childAspectRatio: 0.45,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
                children: salesList
                    .map((e) => bottonContainer(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                                  builder: (context) => DetailSalesPage(
                                        name: e.name,
                                        image: e.image,
                                        price: e.price,
                                        oprice: e.oprice,
                                        discount: e.discount,
                                      )));
                        },
                        image: e.image,
                        name: e.name,
                        price: e.price,
                        oprice: e.oprice,
                        discount: e.discount))
                    .toList()),
          ),
        ],
      ),
    );
  }
}

// class Datasearch extends SearchDelegate<String> {
//   final medicines = [
//     "paracetamol",
//     "betadine",
//     "amlod",
//     "astat",
//     "flexon",
//     "dettol"
//   ];

//   final recentMedicines = [
//     "paracetamol",
//     "dettol",
//     "amlod",
//     "astat",
//   ];
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             query = "";
//           })
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//         icon: AnimatedIcon(
//           icon: AnimatedIcons.menu_arrow,
//           progress: transitionAnimation,
//         ),
//         onPressed: () {
//           close(context, null);
//         });
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Card(
//       color: Colors.red,
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestionList = query.isEmpty
//         ? recentMedicines
//         : medicines.where((p) => p.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () {
//           showResults(context);
//         },
//         leading: Icon(Icons.medical_services),
//         title: RichText(
//           text: TextSpan(
//             text: suggestionList[index].substring(0, query.length),
//             style: TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//             ),
//             children: [
//               TextSpan(
//                 text: suggestionList[index].substring(query.length),
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }

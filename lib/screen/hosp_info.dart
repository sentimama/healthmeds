// import 'package:flutter/material.dart';

// class HospitalInfo extends StatefulWidget {
//   @override
//   _HospitalInfoState createState() => _HospitalInfoState();
// }

// class _HospitalInfoState extends State<HospitalInfo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('HealthMeds'),
//         backgroundColor: Colors.green,
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: EdgeInsets.symmetric(
//               horizontal: 10,
//               vertical: 10,
//             ),
//             child: Column(
//               children: [
//                 Divider(
//                   height: 50,
//                   indent: 40,
//                   endIndent: 40,
//                   color: Colors.greenAccent,
//                   thickness: 3,
//                 ),
//                 Text(
//                   "Top 10 Hospitals in 2021",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.w900,
//                   ),
//                 ),
//                 Divider(
//                   height: 50,
//                   indent: 40,
//                   endIndent: 40,
//                   color: Colors.greenAccent,
//                   thickness: 3,
//                 ),
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       hosWidget("vayodha", "Vayodha Hospital",
//                           "Balkhu-Chowk,Kathmandu", "01-4286428, 01-4281666"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("civil", "Civil Hospital",
//                           "Baneshwor,Kathmandu", "01-4107000, 01-4107001"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("norvic", "Norvic Int'l Hospital",
//                           "Thapathali,Kathmandu", "01-5970032, 01-5970033"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("teaching", "Teaching Hospital",
//                           "Maharanjgunj,Kathmandu", "01-4412404, 01-4412411"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("kmc", "KMC Hospital", "Sinamangal,Kathmandu",
//                           "01-523341, 01-5122311"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("bir", "Bir Hospital", "Kantipath,Kathmandu",
//                           "01-443341, 01-4221119"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("grande", "Grande Hospital",
//                           "Tokha Road,Kathmandu", "01-133341, 01-2122311"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("patan", "Patan Hospital",
//                           "Satdobato,Kathmandu", "01-7623341, 01-18122311"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("bb", "B&B Hospital", "Gwarko,Kathmandu",
//                           "01-663341, 01-5522311"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       hosWidget("mediciti", "Mediciti Hospital",
//                           "Nakhhu,Kathmandu", "01-323341, 01-4122311"),
//                       SizedBox(
//                         height: 8,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Container hosWidget(String img, String name, String location, String phone) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 1,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width * 1,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.green[900],
//               ),
//               borderRadius: BorderRadius.all(
//                 Radius.circular(30),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   width: 100,
//                   height: 100,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/$img.png"),
//                     ),
//                   ),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     FlatButton(
//                       onPressed: () {},
//                       child: Text(
//                         "$name",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.w800,
//                           color: Colors.green,
//                         ),
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.arrow_right,
//                         ),
//                         Text(
//                           "$location",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Icon(
//                           Icons.call,
//                           size: 20,
//                         ),
//                         Text(
//                           "$phone",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

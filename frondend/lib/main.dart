// import 'package:flutter/material.dart';
// import 'package:frondend/provider/employe_provider.dart';
// import 'package:frondend/screens/employe_list_screen.dart';
// import 'package:provider/provider.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => EmployeeProvider()),
//       ],
//       child: MaterialApp(
//         title: 'Employee Management',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: EmployeeListScreen(),
//         debugShowCheckedModeBanner: false,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:frondend/provider/employe_provider.dart';
import 'package:frondend/screens/add_employee.dart';
import 'package:frondend/screens/employe_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      child: MaterialApp(
        title: 'Employee Management',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: EmployeeListScreen(),
        routes: {
          '/add-employee': (context) => AddEmployeeScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
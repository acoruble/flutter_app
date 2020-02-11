import 'package:flutter/material.dart';
import 'file:///D:/Documents/COURS/flutter_app/lib/repositories/address_repository.dart';
import 'package:flutter_app/repositories/preferencies_repositories.dart';
import 'package:flutter_app/screens/addcompany.dart';
import 'package:flutter_app/screens/detailscompany.dart';
import 'package:flutter_app/screens/searchAddress.dart';
import 'package:flutter_app/stores/company_store.dart';
import 'package:flutter_app/stores/location_store.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AddressRepository>(create: (context) => AddressRepository(),),
        Provider<CompanyStore>(create: (context) => CompanyStore(PreferenciesRepositories()),),
        Provider<LocationStore>(create: (context) => LocationStore(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
//        'home': (context) => Home(),
          'addcompany': (context) => AddCompany(),
          'searchaddress': (context) => SearchAddress(),
          'detailscompany': (context) => DetailsCompany(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}

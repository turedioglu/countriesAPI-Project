import 'package:flutter/material.dart';
import 'views/country.dart';
import 'views/countryList.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new CountryList(),
    routes: {
      Country.routeName: (ctx) => Country()
    },
  ));
}

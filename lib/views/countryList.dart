import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'country.dart';

class CountryList extends StatefulWidget {
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List countries = [];
  List filteredCountries = [];

  getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    getCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Countries'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: filteredCountries.length > 0
            ? ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Country.routeName,
                          arguments: filteredCountries[index]);
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                      child: ListTile(
                        leading: SvgPicture.network(
                          filteredCountries[index]['flag'],
                          width: 50,
                        ),
                        title: Text(
                          filteredCountries[index]['name'],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Capital: ' + filteredCountries[index]['capital'],
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: null,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Country extends StatelessWidget {
  static const routeName = '/country';

  @override
  Widget build(BuildContext context) {
    final Map country = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(country['name']),
        centerTitle: true,
        leading:  IconButton(
            icon: Icon(Icons.arrow_back_ios),
             color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Divider(
              height: 50,
            ),
            Center(
                child: SvgPicture.network(
              country['flag'],
              width: 200,
            )),
            Divider(
              height: 20,
            ),
            Text(
              country['name'],
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Capital: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: country['capital'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Region: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: country['region'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Subregion: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: country['subregion'],
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black)),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Population: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                  TextSpan(
                      text: country['population'].toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black)),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

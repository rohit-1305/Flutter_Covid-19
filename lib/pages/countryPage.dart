import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:india_corona/datasource.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryBlack,
        title: Text('Country Stats'),
      ),
      body: ListViewCountry(),
    );
  }
}

class ListViewCountry extends StatefulWidget {
  @override
  _ListViewCountryState createState() => _ListViewCountryState();
}

class _ListViewCountryState extends State<ListViewCountry> {
  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v3/covid-19/countries');
    setState(() {
      // .body is bcoz we want data in json format or String format
      countryData = json.decode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return countryData == null
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: countryData == null ? 0 : countryData.length,
            itemBuilder: (context, index) {
              return Container(
                height: 130,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.grey[100], offset: Offset(0, 10)),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            countryData[index]['country'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.network(
                            countryData[index]['countryInfo']['flag'],
                            height: 50,
                            width: 60,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'CONFIRMED : ' +
                                  countryData[index]['cases'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'ACTIVE : ' +
                                  countryData[index]['active'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'RECOVERED : ' +
                                  countryData[index]['recovered'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'DEATHS : ' +
                                  countryData[index]['deaths'].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}

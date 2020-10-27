import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'data.dart';
import 'json.dart';

class PrayTimes extends StatefulWidget {
  PrayTimes({Key key}) : super(key: key);

  @override
  _PrayTimesState createState() => _PrayTimesState();
}

class _PrayTimesState extends State<PrayTimes> {

  JsonConnection jsonConnection = new JsonConnection();
  Data list;

  static String city = 'Dammam';
  static String country = 'Saudi Arabia';
  static int method = 4;

  final String url =
      'http://api.aladhan.com/v1/timingsByCity?city=$city&country=$country&method=$method';

  Future getPTData() async {
    http.Response res = await http.get(Uri.encodeFull(url), headers: {
      "Accept":
      "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8"
    });
    final data = jsonDecode(res.body);

    list = Data.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'مواقيت الصلاة',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: jsonConnection.getPTLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Column(
                  children: [
                    Center(
                      child: Card(
                        elevation: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.event,
                                color: Colors.blue,
                              ),
                              SizedBox(height: 20,),
                              Text(
                                DateTime.now().toString().substring(0,10),
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data.data.timings.fajr,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ' :  الفجر',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.lightBlue,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data.data.timings.dhuhr,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ' :  الظهر',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.lightBlue,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data.data.timings.asr,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ' :  العصر',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.lightBlue,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data.data.timings.maghrib,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ' :  المغرب',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.lightBlue,
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          snapshot.data.data.timings.isha,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Text(
                              ' :  العشاء',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Divider(
                      color: Colors.lightBlue,
                    ),


                  ],
                )
              ),
            );
          } else  {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
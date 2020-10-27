import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import 'package:intl/intl.dart';

import 'package:adhan_flutter/adhan_flutter.dart';

import 'Drawer.dart';


class Times extends StatefulWidget {
  @override
  _TimesState createState() => _TimesState();
}

class _TimesState extends State<Times> {

  // Address: Jagati, Kushtia, Bangladesh
  final latitude = 23.885942;
  final longitude = 45.079162;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
        backgroundColor:    Theme.of(context).brightness == Brightness.dark ? Colors.grey[800]: Color(0xFFFFEDE0),

            appBar: AppBar(
                centerTitle: true,
                title: Text(
                  'مواقيت الصلاة',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Draweer()));
              }),

              ),
            body: Column(children: <Widget>[
              SizedBox(
                height: 50,
              ),
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
                          DateFormat.yMd().format(DateTime.now()),
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(5),
              ),

              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodayFajrTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat.Hm().format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
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
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodaySunriseTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat.Hm().format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                ' :  الشروق',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Divider(
                        color: Colors.lightBlue,
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodayduashTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat.Hm().format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
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
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodayAshTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat('hh:mm').format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
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
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodayTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding:EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat('hh:mm').format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          Padding(
                              padding:EdgeInsets.all(8),
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
                        height: ScreenUtil().setHeight(1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FutureBuilder(
                            future: getTodayIshaTime(),
                            builder:
                                (context, AsyncSnapshot<DateTime> snapshot) {
                              if (snapshot.hasData) {
                                final dateTime = snapshot.data.toLocal();
                                return Padding(
                                  padding:EdgeInsets.all(8),
                                  child: Text(
                                    DateFormat('hh:mm').format(dateTime),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                return Text('Waiting...');
                              }
                            },
                          ),
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                ' :  العشاء',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]));
  }

  Future<DateTime> getTodayFajrTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.fajr;
  }

  Future<DateTime> getTodayduashTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.dhuhr;
  }

  Future<DateTime> getTodayAshTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.asr;
  }

  Future<DateTime> getTodayIshaTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.isha;
  }

  Future<DateTime> getTodaySunriseTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.sunrise;
  }

  Future<DateTime> getTodayTime() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.timeForPrayer(Prayer.MAGHRIB);
  }

  Future<Prayer> getCurrentPrayer() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.currentPrayer();
  }

  Future<Prayer> getNextPrayer() async {
    final adhan = AdhanFlutter.create(Coordinates(latitude, longitude),
        DateTime.now(), CalculationMethod.UMM_AL_QURA);
    return await adhan.nextPrayer();
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String _timeString;
  var scrollController = ScrollController();
  String appBarTitle = "Date from ListView";


  void _scrollListener() {
    if (scrollController.offset != scrollController.position.minScrollExtent &&
        !scrollController.position.outOfRange) {
      // at bottom
      // change the value of the AppBar string
      setState(() {
        appBarTitle = _timeString;
      });
      }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  void _getTime() {
    final String formattedDateTime =
        DateFormat.MMMMd().format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      // print(_timeString);
    });
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 3, //
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),


        body: ListView.builder(

            controller: scrollController,
            itemBuilder: (context, index) {
              return StickyHeader(

                header: Container(
                  height: 70.0,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Text(
                      _timeString.toString(),
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: myBoxDecoration(),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            child: Icon(
                              Icons.home_rounded,
                              size: 80.00,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Город, улица',
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                  ),
                                  Text(
                                    'Отключение: с _______  до ________',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                  Text('Отключение: с _______  до ________',
                                      style: TextStyle(fontSize: 15.0)),

                                  // ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}

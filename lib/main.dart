import 'dart:core';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:tileboxes/location_model.dart';
import 'date_group_separator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  final List<LocationModel> fields = [
    LocationModel("Ужгород", "вул.Шумна", "18:00", "19:00", "18:00", "19:00",
        (DateTime.now())),
    LocationModel("Ужгород", "вул.Капушанська", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 7, 7)),
    LocationModel("Ужгород", "вул.Загорська", "18:00", "21:00", "18:00", "19:00",
        DateTime(2021, 7, 7)),
    LocationModel("Ужгород", "вул.Петефі", "18:00", "22:00", "18:00", "19:00",
        DateTime(2021, 9, 7)),
    LocationModel("Ужгород", "вул.Шумна", "15:00", "16:45", "18:00", "19:00",
        DateTime(2021, 9, 7)),
    LocationModel("Ужгород", "вул.Петефі", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 10, 7)),
    LocationModel("Ужгород", "вул.Швабська", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 11, 7)),
    LocationModel("Ужгород", "вул.Легоцького", "18:00", "20:00", "18:00", "19:00",
        DateTime(2021, 8, 7)),
    LocationModel("Ужгород", "вул.Шумна", "15:00", "16:30", "18:00", "19:00",
        DateTime(2021, 6, 7)),
    LocationModel("Ужгород", "вул.Капушанська", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 6, 8)),
    LocationModel("Ужгород", "вул.Гагаріна", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 6, 8)),
    LocationModel("Ужгород", "вул.Петефі", "13:00", "19:00", "18:00", "19:00",
        DateTime(2021, 3, 9)),
    LocationModel("Ужгород", "вул.Швабська", "18:00", "19:00", "18:00", "19:00",
        DateTime(2021, 2, 9)),
    LocationModel("Ужгород", "вул.Загорська", "10:00", "19:00", "18:00", "19:00",
        DateTime(2021, 5, 12)),
  ];


  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        width: 3, //
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: GroupedListView<dynamic, DateTime>(
            elements: fields,
            groupBy: (fields) {
              return fields.date;
            },
            groupSeparatorBuilder: (DateTime date) => DateGroupSeparator(
              date: date,
            ),
            order: GroupedListOrder.ASC,
            useStickyGroupSeparators: true,
            itemBuilder: (context, dynamic fields) => Card(
              child: Container(
                decoration: myBoxDecoration(),
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
                              child: Container(
                                child: Text(
                                  "${fields.city}, ${fields.street}",
                                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              "Відключення: з ${fields.begin1}  до ${fields.till1} ",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            Text("Відключення: з ${fields.begin2}  до ${fields.till2} ",
                                style: TextStyle(fontSize: 15.0)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}











//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:sticky_headers/sticky_headers.dart';
// import 'package:intl/intl.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: ScrollingDate(),
//
//       //  есть два варианта у меня: или ScrollingDate или Pixels:
//       //  в первом случае не могу дату поменять в хедере, а в другом не знаю, как вместо пикселей внедрить дату
//       // короче, проблема в хедеры дату вставить, которая из сети будет приходить
//     );
//   }
// }
//
// class ScrollingDate extends StatefulWidget {
//   @override
//   _ScrollingDateState createState() => _ScrollingDateState();
// }
//
// class _ScrollingDateState extends State<ScrollingDate> {
//   String _timeString;
//   var scrollController = ScrollController();
//   String appBarTitle = "Initial Value";
//
//   void _scrollListener() {
//     if (scrollController.offset != scrollController.position.minScrollExtent &&
//         !scrollController.position.outOfRange) {
//       // at bottom
//       // change the value of the AppBar string
//       setState(() {
//         appBarTitle = _timeString;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     scrollController = ScrollController();
//     scrollController.addListener(_scrollListener);
//     super.initState();
//     Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
//   }
//
//   void _getTime() {
//     final String formattedDateTime =
//         DateFormat.MMMMd().format(DateTime.now()).toString();
//     setState(() {
//       _timeString = formattedDateTime;
//       // print(_timeString);
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(appBarTitle),
//         ),
//         body: ListView.builder(
//             controller: scrollController,
//             itemBuilder: (context, index) {
//               return StickyHeader(
//                 header: Container(
//                   height: 70.0,
//                   color: Colors.white,
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   alignment: Alignment.centerLeft,
//                   child: Center(
//                     child: Text(
//                       _timeString.toString(),
//                       style: const TextStyle(fontSize: 40.0),
//                     ),
//                   ),
//                 ),
//                 content: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Tile()
//                 ),
//               );
//             }));
//   }
// }
//
// class Pixels extends StatefulWidget {
//   Pixels({Key key}) : super(key: key);
//
//   @override
//   _PixelsState createState() => _PixelsState();
// }
//
// class _PixelsState extends State<Pixels> {
//   ScrollController _scrollController;
//   double _scrollPosition;
//
//   _scrollListener() {
//     setState(() {
//       _scrollPosition = _scrollController.position.pixels;
//     });
//   }
//
//   @override
//   void initState() {
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Position $_scrollPosition pixels'),
//       ),
//       body: Container(
//           child: ListView.builder(
//         controller: _scrollController,
//         itemCount: 20,
//         itemBuilder: (context, index) {
//           return ListTile(
//             leading: Icon(Icons.mood),
//             title: Text('Item: $index'),
//           );
//         },
//       )),
//     );
//   }
// }
//
// class Tile extends StatelessWidget {
//
//   BoxDecoration myBoxDecoration() {
//     return BoxDecoration(
//       border: Border.all(
//         width: 3, //
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Container(
//         decoration: myBoxDecoration(),
//         child: Center(
//           child: Row(
//             children: <Widget>[
//               ClipRRect(
//                 child: Icon(
//                   Icons.home_rounded,
//                   size: 80.00,
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.all(10.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Город, улица',
//                           style: TextStyle(fontSize: 30.0),
//                         ),
//                       ),
//                       Text(
//                         'Отключение: с _______  до ________',
//                         style: TextStyle(fontSize: 15.0),
//                       ),
//                       Text('Отключение: с _______  до ________',
//                           style: TextStyle(fontSize: 15.0)),
//
//                       // ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

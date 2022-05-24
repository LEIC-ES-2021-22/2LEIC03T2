import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/view/Pages/rate_room_page_view.dart';

class RateRoomContext extends StatefulWidget {
  final String room;

  RateRoomContext({
    Key key,
    @required this.room,
  }) : super(key: key);

  @override
  RateRoomContextState createState() => RateRoomContextState();
}

class RateRoomContextState extends State<RateRoomContext> {
  double _ratingValue = 0.0;

  //Pre Defined Comments Part
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: 350,
          height: 350,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]),
          //alignment: Alignment(0, -0.9),
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(children: [
              Align(
                alignment: Alignment(0, -0.8),
                child: Text(
                  "Sala: " + widget.room,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.4),
                  child: RatingBar(
                      initialRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                          full: const Icon(Icons.star,
                              color: const Color(0xFF75171E)),
                          half: const Icon(
                            Icons.star_half,
                            color: const Color(0xFF75171E),
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: const Color(0xFF75171E),
                          )),
                      onRatingUpdate: (value) {
                        setState(() {
                          _ratingValue = value;
                        });
                      })),
              Container(
                  child: Align(
                      alignment: Alignment(0, 1.1),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemCount: entries.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 50,
                              color: const Color(0xFF75171E),
                              child: Center(
                                  child: Text('Entry ${entries[index]}',
                                      style: TextStyle(color: Colors.white))));
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ))),
            ]);
          }))
    ]);
  }
}

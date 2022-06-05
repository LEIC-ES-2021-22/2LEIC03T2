import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/controller/filter_lectures.dart';
import 'package:uni/view/Pages/rate_room_page_view.dart';
import 'package:uni/model/entities/ratedroom.dart';
import 'dart:async';

class ClassificationRoomContext extends StatefulWidget {
  final RatedRoom ratedRoom;

  ClassificationRoomContext({
    Key key,
    @required this.ratedRoom,
  }) : super(key: key);

  @override
  ClassificationRoomContextState createState() => ClassificationRoomContextState();
}

class ClassificationRoomContextState extends State<ClassificationRoomContext> {

  //Pre Defined Comments Part
  final List<String> predefinedcomments = <String>[
    'Falta de material',
    'Desconfortável',
    'Más condições audiovisuais'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: 350,
          height: 400,
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
                  widget.ratedRoom.lecture.room + " (" + widget.ratedRoom.lecture.typeClass + ")",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.4),
                  child: RatingBar(
                      initialRating: widget.ratedRoom.rating,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
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
                      )),
              Container(
                  child: Align(
                      alignment: Alignment(0, 0.7),
                      child: ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemCount: predefinedcomments.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 50,
                              color: (predefinedcomments[index] == widget.ratedRoom.comment ? Color(0xFF75171E) : Colors.grey),
                              child: Center(
                                  child: Text('${predefinedcomments[index]}',
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

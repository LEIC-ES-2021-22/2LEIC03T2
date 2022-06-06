import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TeacherRatingContext extends StatefulWidget {
  final String subject;
  final String teacher;
  final String type;

  TeacherRatingContext({
    Key key,
    @required this.subject,
    @required this.teacher,
    @required this.type,
  }) : super(key: key);

  String getTeacher() {
    return teacher;
  }

  @override
  TeacherRatingContextState createState() => TeacherRatingContextState();
}

class TeacherRatingContextState extends State<TeacherRatingContext> {
  double _ratingValue = 4.0;
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
                alignment: Alignment(0, -0.9),
                child: Text(
                  widget.subject + ' (' + widget.type + ')',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 6,
                          color: const Color(0xFF75171E),
                        )),
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  )),
              Align(
                  alignment: Alignment(0, 0),
                  child: Text(widget.teacher, style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment(0, 0.3),
                  child: RatingBar(
                    initialRating: _ratingValue,
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
                    /*onRatingUpdate: (value) {
                        setState(() {
                          _ratingValue = value;
                        });
                      }*/)),
            ]);
          }))
    ]);
  }
}
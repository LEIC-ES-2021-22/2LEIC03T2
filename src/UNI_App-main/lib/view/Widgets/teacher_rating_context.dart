import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../model/entities/lecture.dart';
import 'package:uni/model/entities/ratedteacher.dart';

class TeacherRatingContext extends StatefulWidget {
  Map<String, dynamic> teacher;

  TeacherRatingContext({
    Key key,
    @required this.teacher,
  }) : super(key: key);

  @override
  TeacherRatingContextState createState() => TeacherRatingContextState();
}

class TeacherRatingContextState extends State<TeacherRatingContext> {

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
                  widget.lecture.teacher,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.4),
                  child: RatingBar(
                    initialRating: widget.ratedTeacher.rating,
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
            ]);
          }))
    ]);
  }
}

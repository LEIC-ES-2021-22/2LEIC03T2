import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
<<<<<<< Updated upstream
import '../../model/entities/lecture.dart';

class TeacherRatingContext extends StatefulWidget {
  String teacher;
  String subject;
  num rating;

  TeacherRatingContext({
    Key key,
    @required this.teacher,
    @required this.subject,
    @required this.rating,
=======
import '../../model/entities/ratedteacher.dart';

class TeacherRatingContext extends StatefulWidget {
  final RatedTeacher ratedTeacher;

  TeacherRatingContext({
    Key key,
    @required this.ratedTeacher,
>>>>>>> Stashed changes
  }) : super(key: key);

  @override
  TeacherRatingContextState createState() => TeacherRatingContextState();
}

class TeacherRatingContextState extends State<TeacherRatingContext> {
<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
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
                alignment: Alignment(0, -0.9),
                child: Text(
<<<<<<< Updated upstream
                  widget.teacher + ' (' + widget.subject + ')',
=======
                  widget.ratedTeacher.lecture.subject + ' (' + widget.ratedTeacher.lecture.typeClass + ')',
>>>>>>> Stashed changes
                  style: TextStyle(fontSize: 25),
                ),
              ),
              Align(
<<<<<<< Updated upstream
                  alignment: Alignment(0, -0.4),
                  child: RatingBar(
                    initialRating: widget.rating,
=======
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
                  child: Text(widget.ratedTeacher.lecture.teacher, style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment(0, 0.3),
                  child: RatingBar(
                    initialRating: widget.ratedTeacher.rating,
>>>>>>> Stashed changes
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    ignoreGestures: true,
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

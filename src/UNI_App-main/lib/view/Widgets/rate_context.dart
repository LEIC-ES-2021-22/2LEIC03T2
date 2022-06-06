import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/controller/filter_lectures.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Pages/rate_room_page_view.dart';
import 'package:uni/view/Pages/rating_submited_page_view.dart';

class RateContext extends StatefulWidget {
  final Lecture lecture;

  RateContext({
    Key key,
    @required this.lecture,
  }) : super(key: key);

  @override
  RateContextState createState() => RateContextState();
}

class RateContextState extends State<RateContext> {
  double _ratingValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          width: 350,
          height: 450,
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
                  widget.lecture.subject +
                      ' (' +
                      widget.lecture.typeClass +
                      ')',
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
                  alignment: Alignment(0, -0.1),
                  child: Text(widget.lecture.teacher,
                      style: TextStyle(fontSize: 18))),
              Align(
                  alignment: Alignment(0, 0.2),
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
                  alignment: Alignment(0, 0.6),
                  child: ElevatedButton(
                    onPressed: () {
                      //Submits rating
                      rateTeacher(widget.lecture.subject, widget.lecture.teacher, _ratingValue);
                      final currentRouteName =
                          ModalRoute.of(context).settings.name;
                      //Change Constants.navAbout to the Main "App" Page
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => RateSubmitedPageView()));
                    },
                    child: const Text('Submeter Classificação'),
                  ))
              ),
              Container(
                  child: Align(
                      alignment: Alignment(0, 0.9),
                      child: ElevatedButton(
                        onPressed: () {
                          final currentRouteName =
                              ModalRoute.of(context).settings.name;
                          //Change Constants.navAbout to the Main "App" Page
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RateRoomView()));
                        },
                        child: const Text('Classificar Sala de Aula'),
                      )))
            ]);
          }))
    ]);
  }
}

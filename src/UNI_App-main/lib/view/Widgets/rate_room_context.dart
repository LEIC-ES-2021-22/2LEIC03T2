import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/controller/filter_lectures.dart';
import 'package:uni/view/Pages/rating_submited_page_view.dart';

class RateRoomContext extends StatefulWidget {
  final Lecture lecture;

  RateRoomContext({
    Key key,
    @required this.lecture,
  }) : super(key: key);

  @override
  RateRoomContextState createState() => RateRoomContextState();
}

class PredefinedComment{
  String comment;
  bool isChecked;

  /// Creates an instance of the class [Lecture].
  PredefinedComment(
      String comment,
      bool isChecked) {
    this.comment = comment;
    this.isChecked = isChecked;
  }

  @override
  int get hashCode => hashValues(comment, isChecked);

  @override
  bool operator ==(o) =>
      o is PredefinedComment &&
          this.comment == o.comment &&
          this.isChecked == o.isChecked;
}

class RateRoomContextState extends State<RateRoomContext> {
  double _ratingValue = 0.0;

  List<PredefinedComment> predefinedComments = [
    PredefinedComment("Falta de material", false),
    PredefinedComment("Desconfortável", false),
    PredefinedComment("Más condições audiovisuais", false),
  ];

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
                alignment: Alignment(0, -0.8),
                child: Text(
                  widget.lecture.room + "(" + widget.lecture.subject + ")",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.65),
                child: Text(
                  widget.lecture.typeClass,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                  alignment: Alignment(0, -0.5),
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
                      alignment: Alignment(0, 0.4),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: predefinedComments.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFF75171E),
                            ),
                            height: 50,
                            child: Center(
                              child: ListTile(
                                title: Text('${predefinedComments[index].comment}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                trailing: Icon(predefinedComments[index].isChecked ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: Colors.white),
                                onTap: () {
                                  setState(() {
                                    for(PredefinedComment predefinedComment in predefinedComments){
                                      if (predefinedComment.isChecked){
                                        predefinedComment.isChecked = false;
                                      }
                                    }
                                    predefinedComments[index].isChecked = true;
                                  });
                                }, // Handle your onTap here.
                              ),
                            )
                          );
                        },
                      ))),
              Container(
                  child: Align(
                      alignment: Alignment(0, 0.85),
                      child: ElevatedButton(
                        onPressed: () {

                          for(PredefinedComment predefinedComment in predefinedComments){
                            if(predefinedComment.isChecked)
                            //Submits & processes data to the database
                            addRoomRating(widget.lecture.subject, widget.lecture.room, _ratingValue, predefinedComment.comment);
                          }

                          final currentRouteName =
                              ModalRoute.of(context).settings.name;
                          //Change Constants.navAbout to the Main "App" Page
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RateSubmitedPageView()));
                        },
                        child: const Text('Submeter Avaliação'),
                      )))
            ]);
          }))
    ]);
  }
}

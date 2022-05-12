import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateContext extends StatefulWidget{
  final String subject;
  final String teacher;

  RateContext({
    Key key,
    @required this.subject,
    @required this.teacher,
  }) : super(key:key);

  @override
  RateContextState createState() => RateContextState();
}

class RateContextState extends State<RateContext>{
  double _ratingValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return /*Center(
      child: Container(
        padding: EdgeInsets.only(left:12.0, bottom: 8.0, right: 12),
        margin: EdgeInsets.only(top:8.0),
        color: Colors.black,
        ),
      );
  }*/

    
    /*Scaffold(
      /*appBar: AppBar(
        leading: Builder(builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          iconSize: 35, 
          onPressed: () {
          Scaffold.of(context).openDrawer();
          },
        ),
        ),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset('assets/images/classtats_logo_extended.png', height: 200, width: 200),
        centerTitle: true,
        backgroundColor: const Color(0xFF75171E),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.filter_alt,
              size: 35,
            ),
          )
        ],
      ),*/*/
      Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /*Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(color: const Color(0xFFEDE6E7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]
            ),
            child: Center(
              child: Text(
                'Classificações',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),*/
          /*Container(
            width: MediaQuery.of(context).size.width,
            height: 590,
            decoration: BoxDecoration(color: const Color(0xFFEDE6E7),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ]
            ),
            alignment: Alignment(0, -0.8),*/
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
                ]
              ),
              //alignment: Alignment(0, -0.9),
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, -0.9),
                      child: Text(
                        'Engenharia de Software',
                        style: TextStyle(
                          fontSize: 25
                        ),
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
                            )
                        ),
                      child: Icon(
                        Icons.person,
                        size: 70,
                        color: Colors.white,
                      ),
                      )
                      ),
                      Align(
                        alignment: Alignment(0, 0),
                        child: Text(
                          'José Carlos Medeiros de Campos',
                          style: TextStyle(
                            fontSize: 18
                          )
                        )
                      ),
                      Align(alignment: Alignment(0, 0.3),
                      child: RatingBar( 
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: const Icon(Icons.star, color: const Color(0xFF75171E)),
                          half: const Icon(
                            Icons.star_half,
                            color: const Color(0xFF75171E),
                          ),
                          empty: const Icon(
                            Icons.star_outline,
                            color: const Color(0xFF75171E),
                          )
                          ),
                        onRatingUpdate: (value) {
                          setState(() {
                            _ratingValue = value;
                      }
                );})),
                      Align(
                        alignment: Alignment(0.7, 0.9),
                        child: Text(
                          'Classificar aula',
                          style: TextStyle(
                            fontSize: 15,
                            color: const Color(0xFF75171E)
                          )
                        )
                      ),
                      Align(
                        alignment: Alignment(0.92,0.92),
                        child: Icon(
                          Icons.arrow_downward,
                          color: const Color(0xFF75171E)
                        )
                      )
                  ]
                      );
              }
              )
              )
          ]
              );
              
    }
}
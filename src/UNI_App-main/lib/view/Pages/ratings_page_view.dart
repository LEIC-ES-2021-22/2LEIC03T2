import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/rate_class_page_view.dart';
import 'package:uni/view/Pages/classification_room_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions_clasStats.dart';
import 'package:uni/utils/constants.dart' as Constants;

class ClasStatsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ClasStatsPageViewState();
}

/// Manages the 'about' section of the app.
class ClasStatsPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    //Button
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ListView(
      children: <Widget>[
        Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Image.asset(
              'assets/images/clasStats_logo.png', //Add ClasStats logo
              width: queryData.size.height / 7,
              height: queryData.size.height / 7,
            )),
        Center(
            child: Padding(
          padding: EdgeInsets.only(
              left: queryData.size.width / 12,
              right: queryData.size.width / 12,
              top: queryData.size.width / 12),
          //bottom: queryData.size.width / 12),
          child: Column(children: <Widget>[
            TermsAndConditionsClasStats(), //Fetches Text
          ]),
        )),
        Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  final currentRouteName = ModalRoute.of(context).settings.name;
                  //Change Constants.navAbout to the Main "App" Page
                  if (currentRouteName != Constants.navSchedule) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => RateClassView()));
                  }
                },
                child: const Text('Classificar Aulas'),
              ),
              ElevatedButton(
                style: style,
                onPressed: () {
                  final currentRouteName = ModalRoute.of(context).settings.name;
                  //Change Constants.navAbout to the Main "App" Page
                  if (currentRouteName != Constants.navSchedule) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => ClassificationRoomView()));
                  }
                },
                child: const Text('Visualizar Classificações'),
              ),
            ],
          ),
        )
      ],
    );
  }
}


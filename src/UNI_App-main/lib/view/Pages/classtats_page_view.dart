import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions_clasStats.dart';
import 'package:uni/utils/constants.dart' as Constants;

import 'exams_page_view.dart';

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
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

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
                  if (currentRouteName != Constants.navAbout) {
                    Navigator.pushNamed(context, '/${Constants.navAbout}');
                  }
                },
                child: const Text('I Understood'),
              ),
            ],
          ),
        )
      ],
    );
  }


}

Widget build(BuildContext context) {
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  return Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          style: style,
          onPressed: null,
          child: const Text('Disabled'),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: style,
          onPressed: () {},
          child: const Text('I Understood'),
        ),
      ],
    ),
  );
}
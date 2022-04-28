import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions_clasStats.dart';
import 'package:uni/utils/constants.dart' as Constants;

import 'exams_page_view.dart';

class RatingsPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RatingsPageViewState();
}

/// Manages the 'about' section of the app.
class RatingsPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    //Button
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return ListView(
      children: <Widget>[
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
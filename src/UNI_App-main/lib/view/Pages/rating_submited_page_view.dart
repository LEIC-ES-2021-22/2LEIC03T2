import 'package:flutter/material.dart';
import 'package:uni/view/Pages/general_page_view.dart';
import 'package:uni/view/Pages/rate_class_page_view.dart';
import 'package:uni/view/Pages/classification_room_page_view.dart';
import 'package:uni/view/Widgets/terms_and_conditions_clasStats.dart';
import 'package:uni/utils/constants.dart' as Constants;

class RateSubmitedPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RateSubmitedPageViewState();
}

/// Manages the 'about' section of the app.
class RateSubmitedPageViewState extends GeneralPageViewState {
  @override
  Widget getBody(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    //Button
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child:
        Text('Avaliação submetida com sucesso! Obrigado.', textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
    );
  }
}


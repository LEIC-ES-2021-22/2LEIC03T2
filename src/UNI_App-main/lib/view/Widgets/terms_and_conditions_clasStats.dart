import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:uni/controller/load_static/terms_and_conditions_clasStats.dart';
import 'package:uni/view/Pages/rate_class_page_view.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionsClasStats extends StatelessWidget {
  static String termsAndConditionsSaved = 'Loading Terms and Conditions...';

  @override
  Widget build(BuildContext context) {
    final Future<String> termsAndConditionsFuture =
        readTermsAndConditionsClasStats();
    return FutureBuilder(
        future: termsAndConditionsFuture,
        builder:
            (BuildContext context, AsyncSnapshot<String> termsAndConditions) {
          if (termsAndConditions.connectionState == ConnectionState.done &&
              termsAndConditions.hasData) {
            termsAndConditionsSaved = termsAndConditions.data;
          }
          return MarkdownBody(
            styleSheet: MarkdownStyleSheet(),
            shrinkWrap: false,
            data: termsAndConditionsSaved,
            onTapLink: (text, url, title) async {
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/rate_page_title.dart';
import 'package:uni/view/Widgets/rate_context.dart';

class RateClassView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RateClassViewState();
}

class RateClassViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return RateList();
  }
}

class RateList extends StatelessWidget {
  RateList({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(children: <Widget>[
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: this.createRateColumn(queryData, context),
      ))
    ]);
  }

  List<Widget> createRateColumn(queryData, context) {
    final List<Widget> columns = <Widget>[];
    columns.add(RatePageTitle(name: 'Classificações'));
    columns.add(this.createRateCard(context));
    return columns;
  }

  Widget createRateCard(context) {
    final List<Widget> rateCards = <Widget>[];
    rateCards
        .add(createRateContext(context, 'XX', 'Engenharia de Software', 'TP'));
    return Column(children: rateCards);
  }

  Widget createRateContext(
      context, String subject, String teacher, String type) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RateContext(
          subject: subject,
          teacher: teacher,
          type: type,
        ),
      ),
    );
  }
}

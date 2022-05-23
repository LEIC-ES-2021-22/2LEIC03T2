import 'package:flutter/material.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/rate_page_title.dart';
import 'package:uni/view/Widgets/rate_context.dart';
import 'package:uni/view/Widgets/teacher_rating_context.dart';

class TeachersRatingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TeachersRatingsViewState();
}

class TeachersRatingsViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context) {
    return RateList();
  }
}

class TeacherRateList extends StatelessWidget {
  TeacherRateList({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(children: <Widget>[
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: this.createTeacherRateColumn(queryData, context),
      ))
    ]);
  }

  List<Widget> createTeacherRateColumn(queryData, context) {
    final List<Widget> columns = <Widget>[];
    columns.add(RatePageTitle(name: 'Classificações'));
    columns.add(this.createTeacherRateCard(context));
    return columns;
  }

  Widget createTeacherRateCard(context) {
    final List<Widget> rateCards = <Widget>[];
    rateCards
        .add(createTeacherRateContext(context, 'XX', 'Engenharia de Software', 'TP'));
    return Column(children: rateCards);
  }

  Widget createTeacherRateContext(
      context, String subject, String teacher, String type) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: TeacherRatingContext(
          subject: subject,
          teacher: teacher,
          type: type,
        ),
      ),
    );
  }
}
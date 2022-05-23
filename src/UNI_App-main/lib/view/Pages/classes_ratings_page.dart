import 'package:flutter/cupertino.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/rate_page_title.dart';
import 'package:uni/view/Widgets/class_context.dart';

class ClassRatingsView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ClassRatingsViewState();
}

class ClassRatingsViewState extends SecondaryPageViewState {
  @override
  Widget getBody(BuildContext context){
    return ClassRatingsList();
  }
}

class ClassRatingsList extends StatelessWidget {
  ClassRatingsList({Key key}) : super(key:key);

  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);
    return ListView(children: <Widget>[
      Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: this.createClassesColumn(queryData, context),
      ))
    ]);
  }

   List<Widget> createClassesColumn(queryData, context) {
    final List<Widget> columns = <Widget>[];
    columns.add(RatePageTitle(name: 'Classificações'));
    columns.add(this.createClassCard(context));
    return columns;
  }
  Widget createClassCard(context) {
    final List<Widget> classCards = <Widget>[];
    classCards
        .add(createClassContext(context,'Engenharia de Software'));
    return Column(children: classCards);
  }

  Widget createClassContext(conntext, String subject){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: ClassContext(
          subject: subject,
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:uni/controller/filter_lectures.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:uni/view/Pages/secondary_page_view.dart';
import 'package:uni/view/Widgets/rate_page_title.dart';
import 'package:uni/view/Widgets/rate_context.dart';
import 'package:uni/model/app_state.dart';

class RateClassView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RateClassFutureBuilder();
}

class _RateClassFutureBuilder extends SecondaryPageViewState{
  Future<List<Lecture>> lectures;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getBody(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    lectures = getTodayLectures(store);
    final MediaQueryData queryData = MediaQuery.of(context);

    return DefaultTextStyle(
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
        child: FutureBuilder<List<Lecture>>(
          future: lectures,
          builder:
              (BuildContext context, AsyncSnapshot<List<Lecture>> snapshot) {
            List<Widget> children;
            //
            if (snapshot.hasData) {
              children = <Widget>[
                Expanded(
                  child: ListView(
                    children: List<Widget>.generate(
                      snapshot.data.length,
                      (index) {
                        return Container(
                          child: createRateCard(
                            snapshot.data[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ];
            } else if (snapshot.hasError) {
              children = <Widget>[
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Não foi possível mostrar as aulas'))
              ];
            } else {
              children = const <Widget>[
                SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                ),
              ];
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              ),
            );
          },
        ));
  }

  Widget createRateCard(Lecture lecture) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.fromLTRB(12, 4, 12, 0),
        child: RateContext(
          lecture: lecture,
        ),
      ),
    );
  }
}

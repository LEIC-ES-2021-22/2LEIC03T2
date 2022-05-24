import 'package:uni/model/entities/lecture.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';

Future<List<Lecture>> getTodayLectures(Store<AppState> store) async{
  List<Lecture> lectures = await getLectures(store);

  final now = DateTime.now();
  final nowSeconds = now.hour*3600 + now.minute*60 + now.second;
  final weekday = now.weekday;

  List<Lecture> result = <Lecture>[];

  for(Lecture lecture in lectures){
    /*if(lecture.day == weekday-1 && lecture.startTimeSeconds + lecture.blocks >= nowSeconds){
      result.add(lecture);
    }*/
    if(lecture.day == weekday-1){
      result.add(lecture);
    }
  }

  return result;
}
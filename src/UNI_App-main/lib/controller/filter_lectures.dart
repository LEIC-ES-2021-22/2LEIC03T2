import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/ratedroom.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:uni/view/Widgets/rate_room_context.dart';

Future<List<Lecture>> getTodayLectures(Store<AppState> store) async {
  List<Lecture> lectures = await getLectures(store);

  final now = DateTime.now();
  final nowSeconds = now.hour * 3600 + now.minute * 60 + now.second;
  final weekday = now.weekday;

  List<Lecture> result = <Lecture>[];

  for (Lecture lecture in lectures) {
    if (lecture.day == weekday - 1 /*&&
        lecture.startTimeSeconds + 60 * 30 * lecture.blocks < nowSeconds*/) {
      result.add(lecture);
    }
  }

  return result;
}


Future<List<Lecture>> getScheduleRooms(Store<AppState> store) async{
  List <Lecture> lectures = await getLectures(store);

  bool foundroom = false;

  List<Lecture> result = <Lecture>[];

  for(Lecture lecture in lectures){
    foundroom = false;
    for(Lecture storedlecture in result){
      if(storedlecture.room == lecture.room){
        foundroom = true;
        break;
      }
    }

    if(!foundroom)
      result.add(lecture);
  }

  return result;
}

Future<List<RatedRoom>> getRatedRooms(Store <AppState> store) async{

  List <Lecture> rooms = await getScheduleRooms(store);
  List<RatedRoom> ratedrooms = <RatedRoom>[];
  double currlecturerating;
  String mostusedcomment;

  for(Lecture lecture in rooms){

    currlecturerating = (await getRoomRating(lecture.room));
    mostusedcomment = (await getCommentRoom(lecture.room));

    RatedRoom ratedRoom = new RatedRoom(lecture, currlecturerating, mostusedcomment);

    ratedrooms.add(ratedRoom);
  }

  return ratedrooms;
}

Future<Map<String, dynamic>> getTeacherRating(String subject) async {
  Map counter = new Map<String, dynamic>();
  Map sum = new Map<String, dynamic>();
  final collection = FirebaseFirestore.instance
      .collection('teachers')
      .where('subject', isEqualTo: subject);
  final querySnapshot = await collection.get();
  for (var doc in querySnapshot.docs) {
    if (counter.containsKey(doc.data()['teacher'])) {
      counter.update(
          doc.data()['teacher'], (value) => counter[doc.data()['teacher']] + 1);
      sum.update(doc.data()['teacher'],
          (value) => counter[doc.data()['teacher']] + doc.data()['rating']);
    } else {
      counter[doc.data()['teacher']] = 1;
      sum[doc.data()['teacher']] = doc.data()['rating'];
    }
  }

  Map result = new Map<String, dynamic>();
  counter.forEach((key, value) {
    result[key] = sum[key] / value;
  });

  return result;
}


Future<double> getRoomRating(String name) async {
  num counter = 0, sum = 0;
  var collection = FirebaseFirestore.instance
      .collection('rooms')
      .where('name', isEqualTo: name);
  var querySnapshot = await collection.get();
  for (var doc in querySnapshot.docs) {
    counter++;
    sum += doc.data()['rating'];
  }
  if (counter == 0) return 0;
  return sum / counter;
}

Future<String> getCommentRoom(String name) async {

  //Initializes comments map to assert what is the most comment one
  final Map<String, int> comments = {
    "Falta de Material": 0,
    "Desconfortável": 0,
    "Más condições audiovisuais": 0,
  };

  int maxcnt = 0;
  String mostchoosedcomment = null;

  var collection = FirebaseFirestore.instance
      .collection('rooms')
      .where('name', isEqualTo: name);
  var querySnapshot = await collection.get();
  for (var doc in querySnapshot.docs) {
    if(comments.containsKey(doc.data()['comment'])){
      comments.update(doc.data()['comment'], (value) => ++value);
    }
  }

  for(String s in comments.keys){
    if(comments[s] > maxcnt){
      maxcnt = comments[s];
      mostchoosedcomment = s;
    }
  }

  return mostchoosedcomment;
}

Future<void> rateRoom(String subject, String name, double rating, String comment) async{
  return FirebaseFirestore.instance.collection('rooms').add(
      {'comment': comment, 'name': name, 'subject': subject, 'rating': rating});
}

Future<void> rateTeacher(String subject, String teacher, double rating){
  return FirebaseFirestore.instance
      .collection('teachers')
      .add({'subject': subject, 'teacher': teacher, 'rating': rating});
}

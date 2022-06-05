import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Lecture>> getTodayLectures(Store<AppState> store) async {
  List<Lecture> lectures = await getLectures(store);

  final now = DateTime.now();
  final nowSeconds = now.hour * 3600 + now.minute * 60 + now.second;
  final weekday = now.weekday;

  List<Lecture> result = <Lecture>[];

  for (Lecture lecture in lectures) {
    if (lecture.day == weekday - 1 &&
        lecture.startTimeSeconds + 60 * 30 * lecture.blocks < nowSeconds) {
      result.add(lecture);
    }
  }

  return result;
}

Future<Map<String, dynamic>> getTeacherRaing(String subject) async {
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
      print('TESTE2');
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

Future<num> getRoomRating(String name) async {
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

Future<void> rateRoom(
    String subject, String name, double rating, String comment) async {
  return FirebaseFirestore.instance.collection('rooms').add(
      {'comment': comment, 'name': name, 'subject': subject, 'rating': rating});
}

Future<void> rateTeacher(String subject, String teacher, double rating) {
  return FirebaseFirestore.instance
      .collection('teachers')
      .add({'subject': subject, 'teacher': teacher, 'rating': rating});
}

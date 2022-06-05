import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:redux/redux.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/redux/action_creators.dart';
import 'package:firebase_core/firebase_core.dart';

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

Future<double> getRateTeacher(String name, String subject) async {
  double sum = 0;
  double counter = 0;

  //final data = FirebaseFirestore.instance.collection('teachers').where('name',isEqualTo: name).where('subject', isEqualTo: subject);
  //FirebaseFirestore.instance.collection('teachers').snapshots()
}

Future<void> addRoomRating(
    String subject, String name, double rating, String comment) async {
  return FirebaseFirestore.instance.collection('rooms').add(
      {'comment': comment, 'name': name, 'subject': subject, 'rating': rating});
}

Future<void> addClassRating(String subject, String teacher, double rating) {
  return FirebaseFirestore.instance
      .collection('teachers')
      .add({'subject': subject, 'teacher': teacher, 'rating': rating});
}

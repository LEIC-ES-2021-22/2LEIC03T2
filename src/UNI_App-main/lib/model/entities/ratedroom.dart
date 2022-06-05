import 'package:flutter/rendering.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/entities/lecture.dart';


/// Stores information about a lecture.
class RatedRoom {
  Lecture lecture;
  double rating;
  String comment;

  /// Creates an instance of the class [Lecture].
  RatedRoom(
      Lecture lecture,
      double rating,
      String comment) {
    this.lecture = lecture;
    this.rating = rating;
    this.comment = comment;
  }


  @override
  int get hashCode => hashValues(lecture, rating);

  @override
  bool operator ==(o) =>
      o is RatedRoom &&
          this.lecture == o.lecture &&
          this.rating == o.rating;
}

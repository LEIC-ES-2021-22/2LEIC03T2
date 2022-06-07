import 'package:flutter/rendering.dart';
import 'package:logger/logger.dart';
import 'package:uni/model/entities/lecture.dart';


/// Stores information about a lecture.
class RatedTeacher {
  Lecture lecture;
  double rating;

  /// Creates an instance of the class [Lecture].
  RatedTeacher(
      Lecture lecture,
      double rating) {
    this.lecture = lecture;
    this.rating = rating;
  }


  @override
  int get hashCode => hashValues(lecture, rating);

  @override
  bool operator ==(o) =>
      o is RatedTeacher &&
          this.lecture == o.lecture &&
          this.rating == o.rating;
}

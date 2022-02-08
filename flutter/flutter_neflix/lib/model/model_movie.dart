import 'package:flutter/material.dart';

class Movie {
  String title = '';
  String keyword = '';
  String poster = '';
  bool like = false;

  Movie.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  @override
  String toString() => "Movie<$title:$keyword>";
}

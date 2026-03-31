import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDependencies {
  const AppDependencies({
    required this.db,
    required this.dio,
    required this.shp,
    required this.connectivity,
    required this.locale,
    required this.isLight,
  });

  final Dio dio;
  final SharedPreferences shp;
  final Connectivity connectivity;
  final Database db;

  final Locale locale;
  final bool isLight;
}

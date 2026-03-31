import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../constants/constants.dart';
import '../dependency/app_dependencies.dart';
import '../service/db_service.dart';

class InitializeApp {
  const InitializeApp();

  Future<AppDependencies> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    final shp = await SharedPreferences.getInstance();
    final db = await DbService.initialize();

    final connectivity = Connectivity();

    final isLight = shp.getBool(Constants.isLight) ?? true;

    final locale = Locale(shp.getString(Constants.langCode) ?? 'en');

    final dio = Dio(
      BaseOptions(
        baseUrl: Constants.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    /// 6. Api Service va Repozitoriyalar
    // final apiService = ApiService(dio: dio);
    // final taskRepository = TaskRepositoryImpl(apiService: apiService);

    /// 7. Barcha bog'liqliklarni (Dependencies) qaytarish
    return AppDependencies(
      dio: dio,
      shp: shp,

      connectivity: connectivity,
      isLight: isLight,
      db: db.db,
      locale: locale,
      // taskRepository: taskRepository,
    );
  }
}

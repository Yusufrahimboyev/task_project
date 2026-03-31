import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



import '../../features/auth/screens/sign_up_screen.dart';
import '../l10n/generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    );
  }
}

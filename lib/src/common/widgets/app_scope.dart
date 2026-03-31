import 'package:flutter/material.dart';

import '../dependency/app_dependencies.dart';

class AppScope extends StatefulWidget {
  const AppScope({super.key, required this.child, required this.dependencies});

  final Widget child;
  final AppDependencies dependencies;

  @override
  State<AppScope> createState() => AppScopeState();
}

class AppScopeState extends State<AppScope> {
  late final AppDependencies appDependencies;

  @override
  void initState() {
    appDependencies = widget.dependencies;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

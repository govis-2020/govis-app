import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:govis/App.dart';
import 'package:govis/Dependencies.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final dependencies = Dependencies();
  runApp(MyApp(dependencies: dependencies));
}

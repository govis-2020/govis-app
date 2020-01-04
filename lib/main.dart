import 'package:flutter/material.dart';
import 'package:govis/App.dart';
import 'package:govis/Dependencies.dart';

void main() {
  final dependencies = Dependencies();
  runApp(MyApp(dependencies: dependencies));
}

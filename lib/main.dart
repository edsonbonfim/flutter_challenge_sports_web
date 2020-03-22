import 'package:challenge/app.dart';
import 'package:challenge/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton(HomeController());
  runApp(App());
}

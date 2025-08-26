import 'package:archtech/app.dart';
import 'package:archtech/core/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await Injection.init();

  runApp(const MyApp());
}

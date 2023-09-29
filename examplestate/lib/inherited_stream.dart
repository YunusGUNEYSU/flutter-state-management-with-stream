// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:examplestate/controller.dart';

final class Streamer extends InheritedWidget {
  const Streamer({super.key, required super.child, required this.controller});
  final Controller controller;
  @override
  bool updateShouldNotify(Streamer oldWidget) {
    return controller != oldWidget.controller;
  }

  static Streamer? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Streamer>();
  }
}



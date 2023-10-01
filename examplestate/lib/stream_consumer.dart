import 'dart:async';

import 'package:flutter/material.dart';

class Consumer<T> extends StatefulWidget {
  const Consumer(
      {super.key, required this.streamController, this.initalData, required this.builder});
  final StreamController<T> streamController;
  final Widget Function(BuildContext buildContext, AsyncSnapshot<T> snapshot) builder;
  final dynamic initalData;
  

  @override
  State<Consumer<T>> createState() => _ConsumerState<T>();
}

class _ConsumerState<T> extends State<Consumer<T>> {
  late Stream<T> stateStream;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    stateStream = widget.streamController.stream;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        stream: stateStream, initialData: widget.initalData, builder: widget.builder);
  }
}

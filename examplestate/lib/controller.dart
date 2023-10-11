// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

class Controller {
  int _count = 0;
  int get count => _count;

  StreamController<int> controller = StreamController.broadcast();
  StreamController<Record> controller2 = StreamController.broadcast();
  void incCount() {
    _count++;
    controller.sink.add(_count);
  }

  void decCount() {
    _count--;
    controller.sink.add(_count);
  }
}

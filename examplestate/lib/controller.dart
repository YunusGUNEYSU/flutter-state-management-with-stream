import 'dart:async';
class Controller {
  int _count = 0;
  int get count => _count;
  StreamController<int> controller = StreamController.broadcast();
  Stream<String> stream = Stream.value("b");
  void incCount() {
    _count++;
    controller.sink.add(_count);
  }

  void decCount() {
    _count--;
    controller.sink.add(_count);
  }
}


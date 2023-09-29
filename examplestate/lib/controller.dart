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



abstract class BaseStream<T> {
  T? data;
}

class StreamManagement<T extends BaseStream> {
  StreamController<T> controller = StreamController.broadcast();
}

class CountModel extends BaseStream {
  int count = 0;
}

class CounterController extends StreamManagement {
  CountModel countModel = CountModel();
  void inc() {
    controller.sink.add(countModel);
  }
}

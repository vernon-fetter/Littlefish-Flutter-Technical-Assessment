import 'dart:async';

class CounterBloc {
  int _counter = 0;
  final _counterStreamController = StreamController<int>();

  Stream<int> get counterStream => _counterStreamController.stream;

  void increment() {
    _counter++;
    _counterStreamController.sink.add(_counter);
  }

  void decrement() {
    _counter--;
    _counterStreamController.sink.add(_counter);
  }

  void dispose() {
    _counterStreamController.close();
  }
}

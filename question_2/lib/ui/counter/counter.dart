import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:question_2/state/redux/actions.dart';
import 'package:question_2/state/redux/store.dart';

class CounterScreenRedux extends StatelessWidget {
  const CounterScreenRedux({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Counter App (Redux)",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.green[700],
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        body: Center(
          child: StoreConnector<int, int>(
            converter: (store) => store.state,
            builder: (context, count) {
              return Text(
                'Count: $count',
                style: const TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  store.dispatch(IncrementAction());
                },
                tooltip: 'Increment',
                backgroundColor: Colors.green,
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 16),
              FloatingActionButton(
                onPressed: () {
                  store.dispatch(DecrementAction());
                },
                tooltip: 'Decrement',
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
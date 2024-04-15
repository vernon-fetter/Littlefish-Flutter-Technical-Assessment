import 'package:flutter/material.dart';
import 'package:question_1/state/bloc/counter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  final _counterBloc = CounterBloc();

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App (BLOC)",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.blue[700],
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
        child: StreamBuilder<int>(
          stream: _counterBloc.counterStream,
          initialData: 0,
          builder: (context, snapshot) {
            return Text(
              'Count: ${snapshot.data}',
              style: const TextStyle(
                fontSize: 24,
              ),
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                _counterBloc.increment();
              },
              tooltip: 'Increment',
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.add,
              ),
            ),
            const SizedBox(height: 16),
            FloatingActionButton(
              onPressed: () {
                _counterBloc.decrement();
              },
              tooltip: 'Decrement',
              backgroundColor: Colors.red,
              child: const Icon(
                Icons.remove,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

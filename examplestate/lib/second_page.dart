import 'package:examplestate/inherited_stream.dart';
import 'package:examplestate/third_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'bb',
            child: const Icon(Icons.arrow_upward),
            onPressed: () {
              Streamer.of(context)?.controller.incCount();
            },
          ),
          FloatingActionButton(
            heroTag: 'aa',
            child: const Icon(Icons.arrow_downward),
            onPressed: () {
              Streamer.of(context)?.controller.decCount();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Second Page'),
            StreamBuilder<int>(
                initialData: Streamer.of(context)?.controller.count,
                stream: Streamer.of(context)?.controller.controller.stream,
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                }),
            ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThirdPage(),
                    )),
                child: const Text('Go Third Page'))
          ],
        ),
      ),
    );
  }
}

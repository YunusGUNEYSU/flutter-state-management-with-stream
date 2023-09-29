import 'package:examplestate/inherited_stream.dart';
import 'package:examplestate/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: StreamBuilder<int>(
                  initialData: Streamer.of(context)?.controller.count,
                  stream: Streamer.of(context)?.controller.controller.stream,
                  builder: (context, snapshot) {
                    return Text(snapshot.data.toString());
                  }))),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ));
            },
            child: const Text('Go Second Page')),
      ),
    );
  }
}

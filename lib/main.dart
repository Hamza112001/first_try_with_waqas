import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final int _counter = 0;
  String textResult = '';
  late TextEditingController _mytextEditingController;
  @override
  void initState() {
    super.initState();
    _mytextEditingController = TextEditingController()
      ..addListener(() {
        setState(() {
          textResult = _mytextEditingController.text;
        });
      });
  }

  @override
  void dispose() {
    _mytextEditingController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      // _counter++;
      textResult = _mytextEditingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(
            width: 200,
            child: TextField(
              controller: _mytextEditingController,
              onChanged: (value) {
                textResult = value;
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

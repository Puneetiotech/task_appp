import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:appcenter/appcenter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:appcenter_analytics/appcenter_analytics.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:appcenter_crashes/appcenter_crashes.dart';
import 'package:logger/logger.dart';

int count = 0;

void initAppCenter() async {
  var appSecret = "04010d4a-591f-4ced-9a06-1d4a4e4683bd";

  await AppCenter.start(
      appSecret, [AppCenterAnalytics.id, AppCenterCrashes.id]);
}

void initalSetup() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');
  var logger = Logger();
  if (env == "dev") {
    logger.d("This is dev branch running");
    count = count + 1;
  } else if (env == "qa") {
    // to show dialogue...
    logger.d("This is qa branch running");
    count = count + 2;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for CICD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home CICD for dev new build'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    //initAppCenter();
    initalSetup();
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            if (count == 1) devButton else if (count == 2) qabutton
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget devButton = ElevatedButton(
  onPressed: () {},
  child: const Text(
    'This is dev',
  ),
);
Widget qabutton = ElevatedButton(
  onPressed: () {},
  child: const Text(
    'This is qa',
  ),
);

import 'package:flutter/material.dart';

import 'app_manager.dart';
import 'component/content.dart';
import 'component/footer.dart';
import 'component/menu.dart';

void main() {
  runApp(const MyApp());
  appMgr.invokeMethod('init');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Beehive Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(color: Colors.black26, child: MenuWidget()),
          const Divider(
            height: 0.5,
            color: Colors.white24,
          ),
          const ContentWidget(),
          const Divider(
            height: 0.5,
            color: Colors.white24,
          ),
          const FooterWidget(),
        ],
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

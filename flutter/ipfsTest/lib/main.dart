import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:chopper/chopper.dart';
// import 'package:grpc/grpc.dart';
// import 'package:path/path.dart';
// import 'package:protobuf/protobuf.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
//import 'package:js/js.dart';

void main() {
  runApp(MyApp());
}

//('ipfsSCDemo-http-client');
// const ipfsSCDemo = ipfsSCDemoClient({
//   host:
//       '/ip4/192.168.0.106/tcp/4001/p2p/Qmbr8XUBNW22yCcerTqQDgqVYLfEDGF67Pn46zoYN9qXni',
//   port: 5001,
//   protocol: 'https'
// }); // leaving out the arguments will default to these values

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'ipfs Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String jsoon;
  String testman = "this is a test";

  Future getObject() async {
    try {
      const JsonCodec json = JsonCodec();
      final response = await Dio().get(
          'https://ipfs.io/ipfs/bafybeifx7yeb55armcsxwwitkymga5xf53dxiarykms3ygqic223w5sk3m#x-ipfs-companion-no-redirect');
      var data = response.toString();
      var json_decode = json.decode(data);

      setState(() {
        jsoon = json_decode;
      });

      //JsonEncoder encoder = JsonEncoder.withIndent('  ');
      //String prettyprint = encoder.convert(json);

      //var object = Object.fromJson(json_decode);
      print(json_decode);

      return json_decode;
      //print(prettyprint);
    } catch (e) {
      print(e);
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
      print('Incremented by one');
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter text',
                    alignLabelWithHint: true)),
            FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: getObject,
                child: Text(
                  "Send",
                )),
            Text(
              'Your sent hash appears here:',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$jsoon',
              style: TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

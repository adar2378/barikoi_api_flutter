import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barikoi/barikoi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BarikoiApi api = BarikoiApi(apiKey: "MTQzNTpMSVlLTlpMVVlM");
  String buttonText = "ReverseGeo";
  String buttonText2 = "GeoCoding";
  String buttonText3 = "AutoComplete";
  String buttonText4 = "Nearby";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(buttonText),
              onPressed: () async {
                setState(() {
                  buttonText = "Loading...";
                });
                try {
                  var result = await api.reverseGeoCoding(
                      lat: "23.7833522", lon: "93.4248978");
                  print(result[0].address);
                } catch (e) {
                  print(e);
                }

                setState(() {
                  buttonText = "found data";
                });
              },
            ),
            RaisedButton(
              child: Text(buttonText2),
              onPressed: () async {
                setState(() {
                  buttonText2 = "Loading...";
                });
                try {
                  var result = await api.geoCoding(placeId: "5");
                  print(result[0].address);
                } catch (e) {
                  print(e);
                }

                setState(() {
                  buttonText2 = "found data";
                });
              },
            ),
            RaisedButton(
              child: Text(buttonText3),
              onPressed: () async {
                setState(() {
                  buttonText3 = "Loading...";
                });
                try {
                  var result = await api.autoComplete(query: "xbit");
                  print(result[0].address);
                } catch (e) {
                  print(e);
                }

                setState(() {
                  buttonText3 = "found data";
                });
              },
            ),
            RaisedButton(
              child: Text(buttonText4),
              onPressed: () async {
                setState(() {
                  buttonText4 = "Loading...";
                });
                try {
                  var result =
                      await api.nearby(lat: "23.7833522", lon: "94.4248978");
                  print(result[0].address);
                } catch (e) {
                  print(e);
                }

                setState(() {
                  buttonText4 = "found data";
                });
              },
            ),
            RaisedButton(
              child: Text(buttonText4),
              onPressed: () async {
                setState(() {
                  buttonText4 = "Loading...";
                });
                try {
                  var result = await api.distance(
                      sourceLatitude: "90.4178546",
                      sourceLongitude: "23.7619058",
                      targetLatitude: "90.4178546",
                      targetLongitude: "23.5619058");
                  print("result: "+result.toString());
                } catch (e) {
                  print(e);
                }

                setState(() {
                  buttonText4 = "found data";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

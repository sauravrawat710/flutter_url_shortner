import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_shortner/screens/url_shortner_screen.dart';
import 'package:url_shortner/screens/url_shortner_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UrlShortnerState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'URL Shortner',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UrlShortnerScreen(),
      ),
    );
  }
}

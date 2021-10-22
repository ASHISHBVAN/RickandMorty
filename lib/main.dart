import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/logic/characterlogic.dart';
import 'package:rick_and_morty/logic/episodelogic.dart';
import 'package:rick_and_morty/view/episodePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (BuildContext context) => Episodes()),
        Provider(create: (BuildContext context) => Characterlogic()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        
      ),
      darkTheme: ThemeData(
        brightness: Brightness.light,
     
      ),
      themeMode: ThemeMode.light,
     
      home: EpisodeList(),
    );
  }
}

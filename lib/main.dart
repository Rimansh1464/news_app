import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provide.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/views/details_screen.dart';

import 'package:news_app/views/home_screen.dart';
import 'package:news_app/views/spacsh_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
    ),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),),

  ],
  builder: (context, child) {

    return MaterialApp(
      themeMode: (Provider.of<ThemeProvider>(context).isDark) ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(backgroundColor: Color(0xffeaeaf1),
          primaryColor: Colors.black,cardColor: Colors.white),
      darkTheme: ThemeData(backgroundColor: Colors.black,
          primaryColor: Colors.white,
          cardColor: const Color(0xff434345)),
      initialRoute: 'spacshScreen',
      routes: {
        '/': (context) => HomeScreen(),
        'DetailScreen': (context) => DetailScreen(),
        'spacshScreen': (context) => spacshScreen(),
      },
    );
  },
  ),);
}

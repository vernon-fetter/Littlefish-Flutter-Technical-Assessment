import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:question_3/providers/page_provider.dart';
import 'package:question_3/ui/welcome/welcome.dart';
import 'package:question_3/ui/characters/characters.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PageProvider>(
          create: (_) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Rick and Morty Characters (Question 3)',
        theme: ThemeData(
          primarySwatch: Colors.green,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/characters': (context) => const CharacterPage(),
        },
      ),
    );
  }
}

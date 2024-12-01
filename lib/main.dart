import 'package:flutter/material.dart';
import 'package:qiyamy/pages/al_ahzab_page.dart';
import 'package:qiyamy/pages/al_wird_page.dart';
import 'package:qiyamy/pages/home_page.dart';
import 'package:qiyamy/pages/more_page.dart';
import 'package:qiyamy/pages/qiyami_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qiyami',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Directionality(textDirection: TextDirection.rtl, child: HomePage()),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/alahzabpage': (context) => const AlAhzabPage(),
        '/qiyamipage': (context) => const QiyamiPage(),
        '/wirdpage': (context) => const AlWirdPage(),
        '/morepage': (context) => const MorePage(),
      },
    );
  }
}

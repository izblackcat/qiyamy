import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qiyamy/pages/al_ahzab_page.dart';
import 'package:qiyamy/pages/al_wird_page.dart';
import 'package:qiyamy/pages/home_page.dart';
import 'package:qiyamy/pages/more_page.dart';
import 'package:qiyamy/pages/al_qiyam_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // ignore: unused_local_variable
  var alAhzabBox = await Hive.openBox("alAhzabBox");

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
      home: const Directionality(
          textDirection: TextDirection.rtl, child: HomePage()),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/alahzabpage': (context) => const AlAhzabPage(),
        '/alqiyampage': (context) => const AlQiyamPage(),
        '/alwirdpage': (context) => const AlWirdPage(),
        '/morepage': (context) => const MorePage(),
      },
    );
  }
}

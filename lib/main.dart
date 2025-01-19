import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qiyamy/pages/al_ahzab_page.dart';
import 'package:qiyamy/pages/al_wird_page.dart';
import 'package:qiyamy/pages/home_page.dart';
import 'package:qiyamy/pages/more_page.dart';
import 'package:qiyamy/pages/al_qiyam_page.dart';
import 'package:qiyamy/pages/settings/choose_memorized_hizbs_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  await initializeBoxes();

  checkBoxes();

  runApp(const MyApp());
}

void checkBoxes() {
  print('__________________________');
  if (Hive.isBoxOpen('alAhzabBox') && Hive.isBoxOpen('memorizedAhzab')) {
    print('All boxes are open');
  } else {
    print('One or more boxes are not open');
  }
}

Future<void> initializeBoxes() async {
  await Hive.openBox("alAhzabBox");
  await Hive.openBox("memorizedAhzab");
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
        '/choose_hizbs': (context) => const ChooseMemorizedHizbsPage(),
      },
    );
  }
}

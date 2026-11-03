import 'package:flutter/material.dart';

import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/facebook_page.dart';
import 'pages/home_page.dart';
import 'pages/menu_page.dart';
import 'pages/twitter_page.dart';
import 'routes.dart';

const Color _brandRed = Color(0xFFC62D1F);
const Color _cream = Color(0xFFFFF4E6);

void main() {
  runApp(const JamaliPizzariaApp());
}

class JamaliPizzariaApp extends StatelessWidget {
  const JamaliPizzariaApp({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = ColorScheme.fromSeed(seedColor: _brandRed)
        .copyWith(primary: _brandRed, onPrimary: Colors.white);

    return MaterialApp(
      title: 'Jamali Pizzaria',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: scheme,
        scaffoldBackgroundColor: _cream,
        appBarTheme: const AppBarTheme(
          backgroundColor: _brandRed,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.menu: (context) => const MenuPage(),
        AppRoutes.about: (context) => const AboutPage(),
        AppRoutes.contact: (context) => const ContactPage(),
        AppRoutes.twitter: (context) => const TwitterPage(),
        AppRoutes.facebook: (context) => const FacebookPage(),
      },
    );
  }
}

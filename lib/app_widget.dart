import 'package:flutter/material.dart';
import 'package:send_to_kindle/pages/splash_page/spash_page.dart';
import 'package:send_to_kindle/shared/theme/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Send to Kindle',
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const SplashPage());
  }
}

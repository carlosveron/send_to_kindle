import 'package:flutter/material.dart';
import 'package:send_to_kindle/pages/my_home_page.dart';
import 'package:send_to_kindle/shared/theme/themes/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Send to Kindle',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const MyHomePage(),
    );
  }
}

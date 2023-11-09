import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/pages/splash_page/spash_page.dart';
import 'package:send_to_kindle/shared/services/provider/providers.dart';
import 'package:send_to_kindle/shared/theme/themes/themes.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userSettings = ref.watch(userSettingsProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Send to Kindle',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: Utils.themeMode(userSettings?.isDarkThemeEnabled ?? true),
        home: const SplashPage());
  }
}

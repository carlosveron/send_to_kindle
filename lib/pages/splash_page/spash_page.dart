import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/pages/home_page/my_home_page.dart';
import 'package:send_to_kindle/pages/kindlemail_page/kindlemail_page.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';
import 'package:send_to_kindle/shared/services/provider/providers.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  late List<UserSettings> _userSettings;

  @override
  void initState() {
    super.initState();

    _userSettings = database.getAll<UserSettings>();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_userSettings.isNotEmpty) {
        ref.read(userSettingsProvider.notifier).state = _userSettings.first;
      }
      Future(() {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => _userSettings.isEmpty
                ? const KindleEmailPage()
                : const MyHomePage()));
      });
    });

    return const Center(
      child: Text('📬'),
    );
  }
}

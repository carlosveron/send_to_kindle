import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/pages/home_page/my_home_page.dart';
import 'package:send_to_kindle/shared/services/provider/providers.dart';
import 'package:send_to_kindle/shared/services/realm/models/user_settings.dart';

class KindleEmailPage extends ConsumerStatefulWidget {
  const KindleEmailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _KindleEmailPageState();
}

class _KindleEmailPageState extends ConsumerState<KindleEmailPage> {
  final emailController = TextEditingController();
  late List<UserSettings> userSettings;
  @override
  void initState() {
    super.initState();

    setState(() {
      userSettings = realmService.getAll<UserSettings>();
      if (userSettings.isNotEmpty &&
          userSettings.first.kindleEmail.isNotEmpty) {
        _navigateToHomePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (userSettings.isNotEmpty) {
      ref.read(userSettingsProvider.notifier).state = userSettings.first;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('📭'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Your Kindle Email',
                ),
                validator: (value) {
                  if (value == null) {
                    return 'Text';
                  }
                  return '';
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _navigateToHomePage,
                child: const Text('Save'),
              )
            ],
          ),
        ));
  }

  _navigateToHomePage() => Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => const MyHomePage()));
}

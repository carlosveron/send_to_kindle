import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/pages/home_page/my_home_page.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class KindleEmailPage extends ConsumerStatefulWidget {
  const KindleEmailPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _KindleEmailPageState();
}

class _KindleEmailPageState extends ConsumerState<KindleEmailPage> {
  final _emailController = TextEditingController();

  bool _isEmailValid = false;
  bool _isError = false;
  final url =
      Uri.parse('https://www.amazon.com.br/hz/mycd/digital-console/alldevices');

  @override
  Widget build(BuildContext context) {
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
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: _isError ? Colors.red : Colors.white,
                  )),
                  //fillColor: _isError ? Colors.red : Colors.white,
                  filled: true,
                  labelText: 'Kindle Email',
                  hintText: 'Your Kindle Email',
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      _isError = false;
                    });
                  }
                  setState(() {
                    _isEmailValid = Utils.isKindleEmailValid(value);
                  });
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    if (_isEmailValid) {
                      _isError = false;
                      database.save<UserSettings>(_defaultSettings());
                      _navigateToHomePage();
                      return;
                    }
                    _isError = true;
                  });
                },
                child: const Text('Save'),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  // Add the action you want to perform when the link is clicked
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch ${url.host}';
                  }
                },
                child: const Text(
                  'Kindle email',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  _navigateToHomePage() {
    Future(() {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MyHomePage()));
    });
  }

  _defaultSettings() => UserSettings(
        Uuid.v4(),
        true,
        'English',
        kindleEmail: [_emailController.text],
      );
}

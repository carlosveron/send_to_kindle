import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/pages/home_page/my_home_page.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';

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
  @override
  void initState() {
    super.initState();
  }

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
              )
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

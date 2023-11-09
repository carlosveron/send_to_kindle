import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';
import 'package:send_to_kindle/shared/services/provider/providers.dart';
import 'package:send_to_kindle/shared/utils/utils.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  late String selectedLanguage;
  late bool isDarkThemeEnabled;
  late List<String> savedEmails;
  late UserSettings _userSettings;

  void loadSettings() {
    _userSettings = ref.watch(userSettingsProvider) ??
        database.getAll<UserSettings>().first;

    selectedLanguage = _userSettings.language;
    isDarkThemeEnabled = _userSettings.isDarkThemeEnabled;
    savedEmails = _userSettings.kindleEmail;
  }

  void saveSettings() {
    final settings = UserSettings(
      Uuid.v4(),
      isDarkThemeEnabled,
      selectedLanguage,
      kindleEmail: savedEmails,
    );
    database.save<UserSettings>(settings);
    ref.read(userSettingsProvider.notifier).state = settings;
  }

  @override
  Widget build(BuildContext context) {
    loadSettings();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          DropdownButton<String>(
            value: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value!;
              });
              saveSettings();
            },
            items: ["English", "Portuguese"]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
          ),
          SwitchListTile(
            title: const Text('Dark Theme'),
            value: isDarkThemeEnabled,
            onChanged: (value) {
              setState(() {
                isDarkThemeEnabled = value;
                saveSettings();
                debugPrint('$isDarkThemeEnabled');
                if (isDarkThemeEnabled) {
                  Utils.themeMode(isDarkThemeEnabled);
                  return;
                }
                Utils.themeMode(isDarkThemeEnabled);
              });
            },
          ),
          ListTile(
            title: const Text('Saved Emails'),
            subtitle: Text(savedEmails.join(", ")),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to add a new email
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Add Email'),
              content: TextField(
                onChanged: (value) {
                  // Add logic to update the email
                },
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Add logic to save the email
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

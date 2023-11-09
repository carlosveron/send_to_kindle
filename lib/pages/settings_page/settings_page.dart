import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/main.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  String selectedLanguage = "English";
  bool isDarkThemeEnabled = false;
  List<String> savedEmails = [];
  late List<UserSettings> _userSettings;
  @override
  void initState() {
    super.initState();
    loadSettings();
  }

  void loadSettings() async {
    setState(() {
      _userSettings = database.getAll<UserSettings>();
    });
  }

  void saveSettings() async {
    // prefs.setString('language', selectedLanguage);
    // prefs.setBool('darkTheme', isDarkThemeEnabled);
    // prefs.setStringList('emails', savedEmails);
    final settings = UserSettings(
      Uuid.v4(),
      isDarkThemeEnabled,
      selectedLanguage,
      kindleEmail: savedEmails,
    );
  }

  @override
  Widget build(BuildContext context) {
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
            },
            items: ["English", "Spanish", "French"]
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

  @override
  void dispose() {
    saveSettings();
    super.dispose();
  }
}

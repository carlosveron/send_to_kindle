import 'package:realm/realm.dart';
part 'user_settings.g.dart';

@RealmModel()
class _UserSettings {
  @PrimaryKey()
  late Uuid id;
  late List<String> kindleEmail;
  late bool isDarkThemeEnabled;
  late String language;
}

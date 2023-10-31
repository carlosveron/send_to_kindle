import 'package:realm/realm.dart';

@RealmModel()
class _Settings {
  @PrimaryKey()
  late Uuid id;
  late String kindleEmail;
  late String theme;
}

import 'package:realm/realm.dart';
import 'package:send_to_kindle/shared/services/database/models/books.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';

var config = Configuration.local([
  Books.schema,
  UserSettings.schema,
]);

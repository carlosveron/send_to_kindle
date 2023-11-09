// var config = Configuration.local(
//   [
//     AudioPlayedModel.schema,
//     DirectoryModel.schema,
//     FileModel.schema,
//     BookMarksModel.schema,
//     MetaDataRealmModel.schema,
//     SettingsModel.schema,
//     ListeningLogModel.schema
//   ],
// );

import 'package:realm/realm.dart';
import 'package:send_to_kindle/shared/services/database/models/books.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';

var config = Configuration.local([
  Books.schema,
  UserSettings.schema,
]);

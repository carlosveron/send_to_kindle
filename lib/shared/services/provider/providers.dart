import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/shared/services/database/models/books.dart';
import 'package:send_to_kindle/shared/services/database/models/user_settings.dart';

final booksProvider = StateProvider<List<Books>?>((ref) => []);
final userSettingsProvider = StateProvider<UserSettings?>((ref) => null);

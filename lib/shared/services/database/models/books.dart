import 'package:realm/realm.dart';
part 'books.g.dart';

@RealmModel()
class _Books {
  @PrimaryKey()
  late String id;
  late DateTime createdAt;
  late String path;
  late int fileSize;
  late DateTime? published;
  late String? title;
  late String? serie;
  late String? author;
  late String? editor;
  late String? year;
  late String? description;
  late List<int> image;
}

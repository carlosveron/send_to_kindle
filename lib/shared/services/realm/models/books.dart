import 'package:realm/realm.dart';
part 'books.g.dart';

@RealmModel()
class _Books {
  @PrimaryKey()
  late Uuid id;
  late DateTime createdAt;
  late DateTime published;
  late String path;
  late String title;
  late String serie;
  late String author;
  late String editor;
  late String year;
  late String description;
  late int fileSize;
  late List<int> image;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Books extends _Books with RealmEntity, RealmObjectBase, RealmObject {
  Books(
    Uuid id,
    DateTime createdAt,
    String path,
    int fileSize, {
    DateTime? published,
    String? title,
    String? serie,
    String? author,
    String? editor,
    String? year,
    String? description,
    Iterable<int> image = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'path', path);
    RealmObjectBase.set(this, 'fileSize', fileSize);
    RealmObjectBase.set(this, 'published', published);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'serie', serie);
    RealmObjectBase.set(this, 'author', author);
    RealmObjectBase.set(this, 'editor', editor);
    RealmObjectBase.set(this, 'year', year);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set<RealmList<int>>(this, 'image', RealmList<int>(image));
  }

  Books._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  DateTime get createdAt =>
      RealmObjectBase.get<DateTime>(this, 'createdAt') as DateTime;
  @override
  set createdAt(DateTime value) =>
      RealmObjectBase.set(this, 'createdAt', value);

  @override
  String get path => RealmObjectBase.get<String>(this, 'path') as String;
  @override
  set path(String value) => RealmObjectBase.set(this, 'path', value);

  @override
  int get fileSize => RealmObjectBase.get<int>(this, 'fileSize') as int;
  @override
  set fileSize(int value) => RealmObjectBase.set(this, 'fileSize', value);

  @override
  DateTime? get published =>
      RealmObjectBase.get<DateTime>(this, 'published') as DateTime?;
  @override
  set published(DateTime? value) =>
      RealmObjectBase.set(this, 'published', value);

  @override
  String? get title => RealmObjectBase.get<String>(this, 'title') as String?;
  @override
  set title(String? value) => RealmObjectBase.set(this, 'title', value);

  @override
  String? get serie => RealmObjectBase.get<String>(this, 'serie') as String?;
  @override
  set serie(String? value) => RealmObjectBase.set(this, 'serie', value);

  @override
  String? get author => RealmObjectBase.get<String>(this, 'author') as String?;
  @override
  set author(String? value) => RealmObjectBase.set(this, 'author', value);

  @override
  String? get editor => RealmObjectBase.get<String>(this, 'editor') as String?;
  @override
  set editor(String? value) => RealmObjectBase.set(this, 'editor', value);

  @override
  String? get year => RealmObjectBase.get<String>(this, 'year') as String?;
  @override
  set year(String? value) => RealmObjectBase.set(this, 'year', value);

  @override
  String? get description =>
      RealmObjectBase.get<String>(this, 'description') as String?;
  @override
  set description(String? value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  RealmList<int> get image =>
      RealmObjectBase.get<int>(this, 'image') as RealmList<int>;
  @override
  set image(covariant RealmList<int> value) => throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<Books>> get changes =>
      RealmObjectBase.getChanges<Books>(this);

  @override
  Books freeze() => RealmObjectBase.freezeObject<Books>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Books._);
    return const SchemaObject(ObjectType.realmObject, Books, 'Books', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('createdAt', RealmPropertyType.timestamp),
      SchemaProperty('path', RealmPropertyType.string),
      SchemaProperty('fileSize', RealmPropertyType.int),
      SchemaProperty('published', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('title', RealmPropertyType.string, optional: true),
      SchemaProperty('serie', RealmPropertyType.string, optional: true),
      SchemaProperty('author', RealmPropertyType.string, optional: true),
      SchemaProperty('editor', RealmPropertyType.string, optional: true),
      SchemaProperty('year', RealmPropertyType.string, optional: true),
      SchemaProperty('description', RealmPropertyType.string, optional: true),
      SchemaProperty('image', RealmPropertyType.int,
          collectionType: RealmCollectionType.list),
    ]);
  }
}

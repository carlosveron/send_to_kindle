// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class UserSettings extends _UserSettings
    with RealmEntity, RealmObjectBase, RealmObject {
  UserSettings(
    Uuid id,
    bool isDarkThemeEnabled,
    String language, {
    Iterable<String> kindleEmail = const [],
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'isDarkThemeEnabled', isDarkThemeEnabled);
    RealmObjectBase.set(this, 'language', language);
    RealmObjectBase.set<RealmList<String>>(
        this, 'kindleEmail', RealmList<String>(kindleEmail));
  }

  UserSettings._();

  @override
  Uuid get id => RealmObjectBase.get<Uuid>(this, 'id') as Uuid;
  @override
  set id(Uuid value) => RealmObjectBase.set(this, 'id', value);

  @override
  RealmList<String> get kindleEmail =>
      RealmObjectBase.get<String>(this, 'kindleEmail') as RealmList<String>;
  @override
  set kindleEmail(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  bool get isDarkThemeEnabled =>
      RealmObjectBase.get<bool>(this, 'isDarkThemeEnabled') as bool;
  @override
  set isDarkThemeEnabled(bool value) =>
      RealmObjectBase.set(this, 'isDarkThemeEnabled', value);

  @override
  String get language =>
      RealmObjectBase.get<String>(this, 'language') as String;
  @override
  set language(String value) => RealmObjectBase.set(this, 'language', value);

  @override
  Stream<RealmObjectChanges<UserSettings>> get changes =>
      RealmObjectBase.getChanges<UserSettings>(this);

  @override
  UserSettings freeze() => RealmObjectBase.freezeObject<UserSettings>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(UserSettings._);
    return const SchemaObject(
        ObjectType.realmObject, UserSettings, 'UserSettings', [
      SchemaProperty('id', RealmPropertyType.uuid, primaryKey: true),
      SchemaProperty('kindleEmail', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('isDarkThemeEnabled', RealmPropertyType.bool),
      SchemaProperty('language', RealmPropertyType.string),
    ]);
  }
}

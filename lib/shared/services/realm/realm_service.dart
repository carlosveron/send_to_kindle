import 'package:realm/realm.dart';

abstract class RealmService {
  Stream<RealmResultsChanges<T>> getResultsAsStream<T extends RealmObject>();

  List<T> query<T extends RealmObject>(String query,
      [List<Object?> args = const []]);

  List<T> getAll<T extends RealmObject>();

  void save<T extends RealmObject>(T object);

  void update<T extends RealmObject>(T object);

  void delete<T extends RealmObject>(T object);

  void deleteMany<T extends RealmObject>(Iterable<T> list);

  void deleteAll();
}

class RealmServiceImpl implements RealmService {
  final Realm realm;

  RealmServiceImpl(this.realm);

  @override
  Stream<RealmResultsChanges<T>> getResultsAsStream<T extends RealmObject>() {
    return realm.all<T>().changes;
  }

  @override
  List<T> query<T extends RealmObject>(String query,
      [List<Object?> args = const []]) {
    return realm.query<T>(query).toList();
  }

  @override
  List<T> getAll<T extends RealmObject>() {
    return realm.all<T>().toList();
  }

  @override
  void save<T extends RealmObject>(T object) {
    realm.writeAsync(() {
      realm.add(object, update: true);
    });
  }

  @override
  void update<T extends RealmObject>(T object) {
    realm.write(() {
      realm.add(object, update: true);
    });
  }

  @override
  void delete<T extends RealmObject>(T object) {
    realm.write(() {
      realm.delete<T>(object);
    });
  }

  @override
  void deleteAll() {
    realm.write(() {
      realm.deleteAll();
    });
  }

  @override
  void deleteMany<T extends RealmObject>(Iterable<T> list) {
    realm.write(() {
      realm.deleteMany(list);
    });
  }
}

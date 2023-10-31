import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/shared/services/realm/realm_service.dart';
import 'package:send_to_kindle/shared/services/realm/ream_config.dart';

class AppModule extends Module {
  AppModule();
  @override
  void binds(i) {
    i.addInstance<Realm>(Realm(config));

    i.addSingleton<RealmService>(RealmServiceImpl.new);
  }
}

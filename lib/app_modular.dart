import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';
import 'package:send_to_kindle/shared/services/database/database_config.dart';
import 'package:send_to_kindle/shared/services/database/database_service.dart';

class AppModule extends Module {
  AppModule();
  @override
  void binds(i) {
    i.addInstance<Realm>(Realm(config));
    i.addSingleton<DataBaseService>(DataBaseServiceImpl.new);
  }
}

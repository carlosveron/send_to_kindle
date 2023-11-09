import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:send_to_kindle/app_modular.dart';
import 'package:send_to_kindle/app_widget.dart';
import 'package:send_to_kindle/shared/services/database/database_service.dart';

final database = Modular.get<DataBaseService>();
void main() {
  runApp(ProviderScope(
      child: ModularApp(module: AppModule(), child: const MyApp())));
}

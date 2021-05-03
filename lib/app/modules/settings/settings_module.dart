import 'package:flutter_auth/app/modules/settings/settings_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/repositories/auth_repository.dart';
import 'settings_store.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SettingsStore(i.get<AuthRepository>())),
    Bind.lazySingleton((i) => AuthRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SettingsPage()),
  ];
}

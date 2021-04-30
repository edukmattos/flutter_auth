import 'package:flutter_auth/app/modules/auth/password_reset/password_reset_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/auth/repositories/auth_repository.dart';
import 'password_reset_store.dart';

class PasswordResetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PasswordResetStore(i.get<AuthRepository>())),
    Bind.lazySingleton((i) => AuthRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => PasswordResetPage()),
  ];
}

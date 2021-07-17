import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/auth/repositories/auth_repository.dart';
import 'sign_in_page.dart';
import 'sign_in_store.dart';

class SignInModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInStore(i.get<AuthRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignInPage()),
  ];
}

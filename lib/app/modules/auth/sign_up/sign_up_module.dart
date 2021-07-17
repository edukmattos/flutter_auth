import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/auth/repositories/auth_repository.dart';
import 'sign_up_page.dart';
import 'sign_up_store.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignUpStore(i.get<AuthRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignUpPage()),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/auth/repositories/auth_repository.dart';
import 'sign_out_page.dart';
import 'sign_out_store.dart';

class SignOutModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignOutStore(i.get<AuthRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignOutPage()),
  ];
}

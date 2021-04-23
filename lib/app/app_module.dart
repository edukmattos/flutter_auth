import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/sign_in/sign_in_module.dart';
import 'modules/auth/sign_up/sign_up_module.dart';
import 'modules/auth/sign_up/sign_up_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignUpStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SignInModule()),
  ];
}

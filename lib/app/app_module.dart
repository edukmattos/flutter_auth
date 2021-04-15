import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/sign_in/sign_in_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SignInModule()),
  ];
}

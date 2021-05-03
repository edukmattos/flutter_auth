import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/password_reset/password_reset_module.dart';
import 'modules/auth/sign_in/sign_in_module.dart';
import 'modules/auth/sign_up/sign_up_module.dart';
import 'modules/home/home_module.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SignInModule()),
    ModuleRoute("/sign_in", module: SignInModule()),
    ModuleRoute("/sign_up", module: SignUpModule()),
    ModuleRoute("/password_reset", module: PasswordResetModule()),
    ModuleRoute("/settings", module: SettingsModule()),
    ModuleRoute("/home", module: HomeModule()),
  ];
}

import 'package:flutter_auth/app/modules/dashboard/dashboard_store.dart';
import 'package:flutter_auth/app/shared/auth/repositories/auth_repository.dart';
import 'package:flutter_auth/app/shared/auth/repositories/interfaces/auth_repository_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';
import 'shared/shared_preferences/repositories/interfaces/shared_repository_interface.dart';
import 'shared/shared_preferences/repositories/shared_repository.dart';
import 'modules/auth/password_reset/password_reset_module.dart';
import 'modules/auth/sign_in/sign_in_module.dart';
import 'modules/auth/sign_out/sign_out_module.dart';
import 'modules/auth/sign_up/sign_up_module.dart';
import 'modules/home/home_module.dart';
import 'modules/dashboard/dashboard_module.dart';
import 'modules/settings/settings_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DashboardStore()),
    Bind<ISharedRepository>((i) => SharedRepository()),
    Bind<IAuthRepository>((i) => AuthRepository()),
    Bind.lazySingleton((i) => AppStore()),
    //Bind.instance((i) => AppStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SignInModule()),
    ModuleRoute("/sign_in", module: SignInModule()),
    ModuleRoute("/sign_up", module: SignUpModule()),
    ModuleRoute("/sign_out", module: SignOutModule()),
    ModuleRoute("/password_reset", module: PasswordResetModule()),
    ModuleRoute("/settings", module: SettingsModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/dashboard", module: DashboardModule()),
  ];
}

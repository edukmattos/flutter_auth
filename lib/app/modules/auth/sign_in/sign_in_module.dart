import 'package:flutter_auth/app/modules/auth/sign_in/sign_in_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/auth/repositories/sign_in_repository.dart';
import 'sign_in_store.dart';

class SignInModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignInStore()),
    Bind.lazySingleton((i) => SignInRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignInPage()),
  ];
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_auth/app/modules/auth/sign_up/sign_up_page.dart';

import 'sign_up_repository.dart';
import 'sign_up_store.dart';

class SignUpModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SignUpStore()),
    Bind.lazySingleton((i) => SignUpRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => SignUpPage()),
  ];
}

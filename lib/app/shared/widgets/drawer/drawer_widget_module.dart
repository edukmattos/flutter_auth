import 'package:flutter_auth/app/shared/widgets/drawer/drawer_widget_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerWidgetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => DrawerWidgetStore()),
  ];

  @override
  final List<ModularRoute> routes = [];
}

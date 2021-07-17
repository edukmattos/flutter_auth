import 'package:mobx/mobx.dart';

import 'package:flutter_auth/app/shared/shared_preferences/repositories/interfaces/shared_repository_interface.dart';
import 'package:flutter_auth/app/shared/shared_preferences/repositories/shared_repository.dart';

part 'drawer_widget_store.g.dart';

class DrawerWidgetStore = _DrawerWidgetStoreBase with _$DrawerWidgetStore;

abstract class _DrawerWidgetStoreBase with Store {
  ISharedRepository sharedRepository = SharedRepository();

  @observable
  String userDisplayName = "EduKMattos";

  _DrawerWidgetStoreBase() {
    sharedPrefsUserDisplayNameLoad();
  }

  @action
  Future<dynamic> sharedPrefsUserDisplayNameLoad() async {
    userDisplayName =
        await sharedRepository.getValue<String>('userDisplayName');
  }
}

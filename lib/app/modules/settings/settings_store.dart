import 'package:flutter_auth/app/app_store.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  final AppStore appStore;

  _SettingsStoreBase(this.appStore);
}

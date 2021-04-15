import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  @observable
  String email = "";

  @action
  changeEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;
}

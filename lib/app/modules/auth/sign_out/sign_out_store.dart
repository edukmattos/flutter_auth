import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/auth/repositories/auth_repository.dart';

part 'sign_out_store.g.dart';

class SignOutStore = _SignOutStoreBase with _$SignOutStore;

abstract class _SignOutStoreBase with Store {
  AuthRepository authRepository;

  _SignOutStoreBase(this.authRepository) {
    signOutRepoSignOutWithGoogle();
  }

  @action
  Future<void> signOutRepoSignOutWithGoogle() async {
    // print("signOutRepoSignOutWithGoogle");
    await authRepository.authRepoSignOutWithGoogle();
    //.then((value) {
    //  if (value) {
    Modular.to.pushNamed('/sign_in');
    //  }
    //});
  }
}

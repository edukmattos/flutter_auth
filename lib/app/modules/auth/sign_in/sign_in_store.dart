import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart' as stringValidator;
import 'package:validators/validators.dart';

import '../../../shared/shared_preferences/repositories/interfaces/shared_repository_interface.dart';
import '../../../shared/shared_preferences/repositories/shared_repository.dart';
import '../../../shared/auth/repositories/auth_repository.dart';

part 'sign_in_store.g.dart';

class SignInStore = _SignInStoreBase with _$SignInStore;

abstract class _SignInStoreBase with Store {
  AuthRepository authRepository;
  ISharedRepository sharedRepository = SharedRepository();

  _SignInStoreBase(
    this.authRepository,
  );

  @observable
  String email = "";

  @action
  changeEmail(String value) {
    email = value;
    print(value);
  }

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;

  @computed
  bool get isFormValid {
    return validateEmail() == null && validatePassword() == null;
  }

  String? validateEmail() {
    var isValid = isNull(email);
    if (isValid) {
      return 'fields.warning_msg.required'.tr();
    } else {
      var isValid = stringValidator.isEmail(email);
      if (isValid) {
        return null;
      } else {
        return 'fields.error_msg.invalid'.tr();
      }
    }
  }

  String? validatePassword() {
    var isValid = isNull(password);
    if (isValid) {
      return 'fields.warning_msg.required'.tr();
    } else {
      var lenght = 8;
      var isValid = stringValidator.isLength(password, lenght);
      if (isValid) {
        return null;
      } else {
        return 'fields.warning_msg.min'.tr(args: [lenght.toString()]);
      }
    }
  }

  @action
  Future<dynamic> authStoreGoogleSignIn() async {
    await authRepository.authRepoSignInWithGoogle().then((response) {
      if (response.success) {
        Modular.to.pushNamed('/home');
      } else {
        throw response;
      }
    });
  }

  @action
  Future<void> authStoreEmailPasswordSignIn({
    required String email,
    required String password,
  }) async {
    await authRepository
        .authRepoSignInEmailPassword(
      email: email.trim(),
      password: password.trim(),
    )
        .then((response) {
      if (response.success) {
        Modular.to.pushNamed('/home');
      } else {
        throw response;
      }
    });
  }
}

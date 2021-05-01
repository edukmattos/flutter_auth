import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:string_validator/string_validator.dart' as stringValidator;
import 'package:validators/validators.dart';

import 'package:flutter_auth/app/shared/auth/repositories/auth_repository.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  AuthRepository authRepository;

  _SignUpStoreBase(
    this.authRepository,
  ) {
    authRepository = Modular.get<AuthRepository>();
  }

  @observable
  String email = "";

  @action
  changeEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  changePassword(String value) => password = value;

  @observable
  String passwordConfirm = "";

  @action
  changePasswordConfirm(String value) {
    print(value);
    passwordConfirm = value;
  }

  @computed
  bool get isFormValid {
    return validateEmail() == null &&
        validatePassword() == null &&
        validatePasswordConfirm() == null;
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

  String? validatePasswordConfirm() {
    var isValid = isNull(passwordConfirm);
    if (isValid) {
      return 'fields.warning_msg.required'.tr();
    } else {
      var lenght = 8;
      var isValid = stringValidator.isLength(passwordConfirm, lenght);
      if (isValid) {
        var isValid = stringValidator.equals(passwordConfirm, password);
        if (isValid) {
          return null;
        } else {
          return 'fields.warning_msg.equals'.tr();
        }
      } else {
        return 'fields.warning_msg.min'.tr(args: [lenght.toString()]);
      }
    }
  }

  @action
  Future<void> signUpStoreEmailPassord({
    required String email,
    required String password,
  }) async {
    await authRepository
        .authRepoSignUpEmailPassword(
      email: email.trim(),
      password: password.trim(),
    )
        .then((response) {
      if (response.success) {
        Modular.to.pushNamed('/dashboard');
      } else {
        throw response;
      }
    });
  }
}

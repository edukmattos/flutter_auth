// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignUpStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignUpStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordConfirmAtom = Atom(name: '_SignUpStoreBase.passwordConfirm');

  @override
  String get passwordConfirm {
    _$passwordConfirmAtom.reportRead();
    return super.passwordConfirm;
  }

  @override
  set passwordConfirm(String value) {
    _$passwordConfirmAtom.reportWrite(value, super.passwordConfirm, () {
      super.passwordConfirm = value;
    });
  }

  final _$authStoreEmailPassordSignUpAsyncAction =
      AsyncAction('_SignUpStoreBase.authStoreEmailPassordSignUp');

  @override
  Future<void> authStoreEmailPassordSignUp(
      {required String email, required String password}) {
    return _$authStoreEmailPassordSignUpAsyncAction.run(() =>
        super.authStoreEmailPassordSignUp(email: email, password: password));
  }

  final _$_SignUpStoreBaseActionController =
      ActionController(name: '_SignUpStoreBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordConfirm(String value) {
    final _$actionInfo = _$_SignUpStoreBaseActionController.startAction(
        name: '_SignUpStoreBase.changePasswordConfirm');
    try {
      return super.changePasswordConfirm(value);
    } finally {
      _$_SignUpStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
passwordConfirm: ${passwordConfirm},
isFormValid: ${isFormValid}
    ''';
  }
}

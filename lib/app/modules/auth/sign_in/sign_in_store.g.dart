// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInStore on _SignInStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SignInStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_SignInStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_SignInStoreBase.password');

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

  final _$authStoreGoogleSignInAsyncAction =
      AsyncAction('_SignInStoreBase.authStoreGoogleSignIn');

  @override
  Future<void> authStoreGoogleSignIn() {
    return _$authStoreGoogleSignInAsyncAction
        .run(() => super.authStoreGoogleSignIn());
  }

  final _$authStoreEmailPasswordSignInAsyncAction =
      AsyncAction('_SignInStoreBase.authStoreEmailPasswordSignIn');

  @override
  Future<void> authStoreEmailPasswordSignIn(
      {required String email, required String password}) {
    return _$authStoreEmailPasswordSignInAsyncAction.run(() =>
        super.authStoreEmailPasswordSignIn(email: email, password: password));
  }

  final _$_SignInStoreBaseActionController =
      ActionController(name: '_SignInStoreBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_SignInStoreBaseActionController.startAction(
        name: '_SignInStoreBase.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_SignInStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isFormValid: ${isFormValid}
    ''';
  }
}

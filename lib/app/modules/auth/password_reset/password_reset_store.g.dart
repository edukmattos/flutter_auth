// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PasswordResetStore on _PasswordResetStoreBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_PasswordResetStoreBase.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_PasswordResetStoreBase.email');

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

  final _$passwordResetStorePasswordResetAsyncAction =
      AsyncAction('_PasswordResetStoreBase.passwordResetStorePasswordReset');

  @override
  Future<void> passwordResetStorePasswordReset({required String email}) {
    return _$passwordResetStorePasswordResetAsyncAction
        .run(() => super.passwordResetStorePasswordReset(email: email));
  }

  final _$_PasswordResetStoreBaseActionController =
      ActionController(name: '_PasswordResetStoreBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_PasswordResetStoreBaseActionController.startAction(
        name: '_PasswordResetStoreBase.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_PasswordResetStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
isFormValid: ${isFormValid}
    ''';
  }
}

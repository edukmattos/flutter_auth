// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStoreBase, Store {
  final _$isDarkAtom = Atom(name: '_AppStoreBase.isDark');

  @override
  bool get isDark {
    _$isDarkAtom.reportRead();
    return super.isDark;
  }

  @override
  set isDark(bool value) {
    _$isDarkAtom.reportWrite(value, super.isDark, () {
      super.isDark = value;
    });
  }

  final _$appThemeAtom = Atom(name: '_AppStoreBase.appTheme');

  @override
  IAppThemeInterface get appTheme {
    _$appThemeAtom.reportRead();
    return super.appTheme;
  }

  @override
  set appTheme(IAppThemeInterface value) {
    _$appThemeAtom.reportWrite(value, super.appTheme, () {
      super.appTheme = value;
    });
  }

  final _$sharedPrefsThemeLoadAsyncAction =
      AsyncAction('_AppStoreBase.sharedPrefsThemeLoad');

  @override
  Future sharedPrefsThemeLoad() {
    return _$sharedPrefsThemeLoadAsyncAction
        .run(() => super.sharedPrefsThemeLoad());
  }

  final _$setThemeAsyncAction = AsyncAction('_AppStoreBase.setTheme');

  @override
  Future setTheme(dynamic value, {bool saveShared = true}) {
    return _$setThemeAsyncAction
        .run(() => super.setTheme(value, saveShared: saveShared));
  }

  final _$_AppStoreBaseActionController =
      ActionController(name: '_AppStoreBase');

  @override
  dynamic changeIsDark(bool value) {
    final _$actionInfo = _$_AppStoreBaseActionController.startAction(
        name: '_AppStoreBase.changeIsDark');
    try {
      return super.changeIsDark(value);
    } finally {
      _$_AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDark: ${isDark},
appTheme: ${appTheme}
    ''';
  }
}

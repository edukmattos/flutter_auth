// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_widget_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawerWidgetStore on _DrawerWidgetStoreBase, Store {
  final _$userDisplayNameAtom =
      Atom(name: '_DrawerWidgetStoreBase.userDisplayName');

  @override
  String get userDisplayName {
    _$userDisplayNameAtom.reportRead();
    return super.userDisplayName;
  }

  @override
  set userDisplayName(String value) {
    _$userDisplayNameAtom.reportWrite(value, super.userDisplayName, () {
      super.userDisplayName = value;
    });
  }

  final _$sharedPrefsUserDisplayNameLoadAsyncAction =
      AsyncAction('_DrawerWidgetStoreBase.sharedPrefsUserDisplayNameLoad');

  @override
  Future<dynamic> sharedPrefsUserDisplayNameLoad() {
    return _$sharedPrefsUserDisplayNameLoadAsyncAction
        .run(() => super.sharedPrefsUserDisplayNameLoad());
  }

  @override
  String toString() {
    return '''
userDisplayName: ${userDisplayName}
    ''';
  }
}

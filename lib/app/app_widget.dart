import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';

class AppWidget extends StatelessWidget {
  //final appStore = Modular.get<AppStore>();

  final AppStore appStore = AppStore();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      // ignore: unnecessary_null_comparison
      if (appStore.themeData != null) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Slidy',
          theme: appStore.themeData,
        ).modular();
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}

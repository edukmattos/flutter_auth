import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';

class AppWidget extends StatelessWidget {
  //final appStore = Modular.get<AppStore>();

  final appStore = AppStore();

  @override
  Widget build(BuildContext context) {
    // Device orientation - start
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    // Device orientation - end
    return Observer(
      builder: (_) {
        print("themew: $appStore.themeData");
        // ignore: unnecessary_null_comparison
        return appStore.themeData != null
            ? MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                title: 'Flutter Slidy',
                theme: appStore.themeData,
              ).modular()
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

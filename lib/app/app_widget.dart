import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';

class AppWidget extends StatelessWidget {
  //final appStore = Modular.get<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // Device orientation - start
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitDown,
          DeviceOrientation.portraitUp,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ]);
        // Device orientation - end
        //print(appStore.appTheme.getTheme().toString());

        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Slidy',
          theme: Modular.get<AppStore>().appTheme.getTheme(),
        ).modular();
      },
    );
  }
}

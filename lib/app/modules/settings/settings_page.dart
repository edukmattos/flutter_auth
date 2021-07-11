import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/widgets/drawer/app_drawer_widget.dart';
import 'settings_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends ModularState<SettingsPage, SettingsStore> {
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('modules.settings.name').tr(),
          Visibility(
            visible: true,
            child: Text(
              ('app.name_short').tr(),
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
      actions: <Widget>[
        Observer(
          name: 'observerSwitchChangeTheme',
          builder: (_) {
            return Switch(
              onChanged: (bool value) {
                controller.appStore.changeIsDark(value);
              },
              value: controller.appStore.isDark,
            );
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      //backgroundColor: Color(0xFF61A8EB),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
        ),
      ),
      drawer: AppDrawerWidget(),
    );
  }
}

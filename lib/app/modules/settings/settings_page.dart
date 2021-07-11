import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:settings_ui/settings_ui.dart';

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

  Widget _buildSettingsList() {
    return SettingsList(
      sections: [
        SettingsSection(
          title: 'Common',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onPressed: (context) {},
            ),
            SettingsTile(
              title: 'Environment',
              subtitle: 'Production',
              leading: Icon(Icons.cloud_queue),
            ),
          ],
        ),
        SettingsSection(
          title: 'Account',
          tiles: [
            SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
            SettingsTile(title: 'Email', leading: Icon(Icons.email)),
            SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
          ],
        ),
        SettingsSection(
          title: 'Security',
          tiles: [
            SettingsTile.switchTile(
              title: 'Lock app in background',
              leading: Icon(Icons.phonelink_lock),
              switchValue: lockInBackground,
              onToggle: (bool value) {
                setState(() {
                  lockInBackground = value;
                  notificationsEnabled = value;
                });
              },
            ),
            SettingsTile.switchTile(
                title: 'Use fingerprint',
                subtitle: 'Allow application to access stored fingerprint IDs.',
                leading: Icon(Icons.fingerprint),
                onToggle: (bool value) {},
                switchValue: false),
            SettingsTile.switchTile(
              title: 'Change password',
              leading: Icon(Icons.lock),
              switchValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
              title: 'Enable Notifications',
              enabled: notificationsEnabled,
              leading: Icon(Icons.notifications_active),
              switchValue: true,
              onToggle: (value) {},
            ),
          ],
        ),
        SettingsSection(
          title: 'Misc',
          tiles: [
            SettingsTile(
                title: 'Terms of Service', leading: Icon(Icons.description)),
            SettingsTile(
                title: 'Open source licenses',
                leading: Icon(Icons.collections_bookmark)),
          ],
        ),
        CustomSection(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 22, bottom: 8),
                child: Image.asset(
                  'assets/settings.png',
                  height: 50,
                  width: 50,
                  color: Color(0xFF777777),
                ),
              ),
              Text(
                'Version: 2.4.0 (287)',
                style: TextStyle(color: Color(0xFF777777)),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
        child: SettingsList(
          sections: [
            SettingsSection(
              title: 'Common',
              tiles: [
                SettingsTile(
                  title: 'Language',
                  subtitle: 'English',
                  leading: Icon(Icons.language),
                  onPressed: (context) {},
                ),
                SettingsTile(
                  title: 'Environment',
                  subtitle: 'Production',
                  leading: Icon(Icons.cloud_queue),
                ),
              ],
            ),
            SettingsSection(
              title: 'Account',
              tiles: [
                SettingsTile(
                  title: '51 99408-0770',
                  subtitle: "Celular",
                  trailing: Icon(Icons.edit_outlined),
                  leading: Icon(Icons.phone),
                  onPressed: (_) {
                    print("TESTE");
                  },
                ),
                SettingsTile(
                    title: 'edukmattos@gmail.com', leading: Icon(Icons.email)),
                SettingsTile(
                    title: 'Sign out', leading: Icon(Icons.exit_to_app)),
              ],
            ),
            SettingsSection(
              title: 'Security',
              tiles: [
                SettingsTile.switchTile(
                  title: 'Lock app in background',
                  leading: Icon(Icons.phonelink_lock),
                  switchValue: lockInBackground,
                  onToggle: (bool value) {
                    setState(() {
                      lockInBackground = value;
                      notificationsEnabled = value;
                    });
                  },
                ),
                SettingsTile.switchTile(
                    title: 'Use fingerprint',
                    subtitle:
                        'Allow application to access stored fingerprint IDs.',
                    leading: Icon(Icons.fingerprint),
                    onToggle: (bool value) {},
                    switchValue: false),
                SettingsTile.switchTile(
                  title: 'Change password',
                  leading: Icon(Icons.lock),
                  switchValue: true,
                  onToggle: (bool value) {},
                ),
                SettingsTile.switchTile(
                  title: 'Enable Notifications',
                  enabled: notificationsEnabled,
                  leading: Icon(Icons.notifications_active),
                  switchValue: true,
                  onToggle: (value) {},
                ),
              ],
            ),
            SettingsSection(
              title: 'Recursos',
              tiles: [
                SettingsTile(
                    title: 'Jurandir, Velson, Janaína',
                    leading: Icon(Icons.people)),
                SettingsTile(
                    title: 'IHG78E4 - 21/04/2021: 12.345Km',
                    leading: Icon(Icons.car_rental)),
              ],
            ),
            CustomSection(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 8),
                    child: Image.asset(
                      'assets/images/app/settings.png',
                      height: 50,
                      width: 50,
                      color: Color(0xFF777777),
                    ),
                  ),
                  Text(
                    'Version: 2.4.0 (287)',
                    style: TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawerWidget(),
    );
  }
}

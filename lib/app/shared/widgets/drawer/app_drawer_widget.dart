import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_drawer_header_widget.dart';
import 'app_drawer_item_widget.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  appDrawerHeaderWidget(),
                  ListTile(
                    title: Text(
                      'Menu',
                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                    ),
                    onTap: () {
                      /* Navigator.pop(context);
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => dealerBuilder()));*/
                    },
                  ),
                  appDrawerItemWidget(
                      icon: Icons.contacts,
                      text: tr('modules.clients.name'),
                      onTap: () {
                        Modular.to.pushNamed('/clients/dashboard');
                      }),
                  appDrawerItemWidget(
                      icon: Icons.event,
                      text: tr('modules.clients.name'),
                      onTap: () {}),
                ],
              ),
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('modules.settings.name').tr(),
                        ),
                        ListTile(
                          leading: Icon(Icons.help),
                          title: Text('Instagram'),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

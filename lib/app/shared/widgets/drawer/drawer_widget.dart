import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'drawer_item_widget.dart';

class DrawerWidget extends StatefulWidget {
  final String userDisplayName;
  final String userEmail;

  DrawerWidget(
      {Key? key, required this.userDisplayName, required this.userEmail})
      : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  //drawerHeaderWidget(),
                  UserAccountsDrawerHeader(
                    accountName: Text(widget.userDisplayName),
                    accountEmail: Text(widget.userEmail),
                    currentAccountPicture: CircleAvatar(
                      child: Text('EM'),
                    ),
                    otherAccountsPictures: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(color: Colors.red),
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/sign_out');
                        },
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text(
                          "Buy now".toUpperCase(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        "Buy now".toUpperCase(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  //
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
                  drawerItemWidget(
                      icon: Icons.contacts,
                      text: tr('modules.clients.name'),
                      onTap: () {
                        Modular.to.pushNamed('/clients/dashboard');
                      }),
                  drawerItemWidget(
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
                    drawerItemWidget(
                        icon: Icons.settings,
                        text: tr('modules.settings.name'),
                        onTap: () {
                          Modular.to.pushNamed('/settings');
                        }),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('Instagram'),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 22, bottom: 8),
                    child: Image.asset(
                      'assets/images/logos/app_logo.png',
                      height: 30,
                      width: 30,
                      //color: Color(0xFF777777),
                    ),
                  ),
                  Text(
                    'Version: 2.4.0 (287)',
                    style: TextStyle(color: Color(0xFF777777)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

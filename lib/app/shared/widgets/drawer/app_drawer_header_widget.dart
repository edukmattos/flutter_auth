import 'package:flutter/material.dart';

Widget appDrawerHeaderWidget() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: Stack(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text('Eduardo Mattos'),
          accountEmail: Text('edukmattos@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: Text('EM'),
          ),
          otherAccountsPictures: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.red),
              ),
              onPressed: () {},
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                "Buy now".toUpperCase(),
                style: TextStyle(fontSize: 14),
              ),
            ),
            CircleAvatar(
              child: Text('K'),
            ),
          ],
        ),
      ],
    ),
  );
}

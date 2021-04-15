import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/theme/fonts.dart';
import 'sign_in_store.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key key, this.title = "SignInPage"}) : super(key: key);
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ModularState<SignInPage, SignInStore> {
  final _scaffoldKey = GlobalKey<FormState>();

  Widget _buildEmailTF() {
    //return Observer(
    //  name: 'observerEmail',
    //  builder: (_) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Text(
        //  "Email",
        //  style: kLabelStyle,
        //),
        SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 45,
          child: Observer(
            name: 'observerEmail',
            builder: (_) {
              return TextFormField(
                autofocus: true,
                onChanged: controller.changeEmail,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: kLabelStyle,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.only(
                    top: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  //hintText: "Entre com seu e-mail",
                  //hintStyle: kHintTextStyle,
                ),
              );
            },
          ),
        )
      ],
    );
    //},
    //);
  }

  Widget _buildPasswordTF() {
    return Observer(
      name: 'observerPassword',
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Text(
            //  "Password",
            //  style: kLabelStyle,
            //),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 45,
              child: TextFormField(
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: kLabelStyle,
                  contentPadding: EdgeInsets.only(
                    top: kDefaultPadding * 0.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //contentPadding: EdgeInsets.only(
                  //  top: 14,
                  //),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  //hintText: "Entre com a sua senha  ",
                  //hintStyle: kHintTextStyle,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(widget.title),
      //),
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF23AEF5),
                  Color(0xFF23AEF5),
                  Color(0xFF23AEF5),
                  Color(0xFF23AEF5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "OpenSans",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _buildEmailTF(),
                  SizedBox(
                    height: 10,
                  ),
                  //_buildPasswordTF(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

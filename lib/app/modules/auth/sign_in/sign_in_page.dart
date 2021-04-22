import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../config/theme/fonts.dart';
import 'sign_in_store.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key? key, this.title = "SignInPage"}) : super(key: key);
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ModularState<SignInPage, SignInStore> {
  final _scaffoldKey = GlobalKey<FormState>();

  Widget _buildEmailTF() {
    return Observer(
      name: 'observerEmail',
      builder: (_) {
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
              height: kDefaultPadding * 2.5,
              child: TextFormField(
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
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: kDefaultPadding * 0.60,
                      end: kDefaultPadding * 0.50,
                    ),
                    // ignore: unrelated_type_equality_checks
                    child: controller.validateEmail() == null
                        ? null
                        : Text(
                            controller.validateEmail()!,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'OpenSans',
                              fontSize: 12,
                            ),
                          ),
                  ),
                  //hintText: "Entre com seu e-mail",
                  //hintStyle: kHintTextStyle,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordTF() {
    return Observer(
        name: 'observerPassword',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Text(
              //  'E-mail',
              //  style: kLabelStyle,
              //),
              //SizedBox(height: kDefaultPadding * 0.5),
              Container(
                alignment: Alignment.centerLeft,
                decoration: kBoxDecorationStyleLight,
                height: kDefaultPadding * 2.5,
                child: Padding(
                  padding: EdgeInsets.only(top: kDefaultPadding * 0.00),
                  child: TextFormField(
                    onChanged: controller.changePassword,
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
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
                      //border: InputBorder.none,
                      labelText: "Password",
                      labelStyle: kLabelStyle,
                      contentPadding: EdgeInsets.only(
                        top: kDefaultPadding * 0.0,
                      ),

                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding * 0.0,
                          vertical: kDefaultPadding * 0.0,
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: kDefaultPadding * 0.60,
                          end: kDefaultPadding * 0.50,
                        ),
                        // ignore: unrelated_type_equality_checks
                        child: controller.validatePassword() == null
                            ? null
                            : Text(
                                controller.validatePassword()!,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'OpenSans',
                                  fontSize: 12,
                                ),
                              ),
                      ),
                    ),
                    //hintText: 'E-mail',
                    //hintStyle: kHintTextStyle,

                    //errorText: controller.validateEmail(),
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _buildSignInBtn() {
    return Observer(
      name: 'submitButtonObserver',
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: RaisedButton(
            elevation: 5.0,
            onPressed: controller.isFormValid
                ? () {
                    print("OK");
                  }
                : () {
                    print("OK");
                  },
            padding: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.blue,
            child: Text(
              "Submit",
              // ignore: lines_longer_than_80_chars
              style: kLightButtonTextStyle20,
            ),
          ),
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
      body: Form(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: kBoxDecorationStyleBackgroundLight,
                ),
                Container(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: kDefaultPadding,
                      vertical: kDefaultPadding,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sing In",
                          style: kFontTextStyle30,
                        ),
                        SizedBox(
                          height: kDefaultPadding * 0.5,
                        ),
                        _buildEmailTF(),
                        SizedBox(
                          height: kDefaultPadding * 1.0,
                        ),
                        _buildPasswordTF(),
                        SizedBox(
                          height: kDefaultPadding * 1.0,
                        ),
                        _buildSignInBtn()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_button/sign_button.dart';

import '../../../core/config/theme/app_config_colors.dart';
import '../../../core/config/theme/fonts.dart';
import 'sign_in_store.dart';

class SignInPage extends StatefulWidget {
  final String title;
  const SignInPage({Key? key, this.title = "SignInPage"}) : super(key: key);
  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends ModularState<SignInPage, SignInStore> {
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
                  labelText: 'fields.email'.tr(),
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
                    Icons.email_outlined,
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
                      labelText: 'fields.password'.tr(),
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
                          Icons.lock_outline_rounded,
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
          child: ElevatedButton(
            //elevation: 5.0,
            onPressed: controller.isFormValid
                ? () {
                    Modular.to.pushNamed('/home');
                  }
                : null,
            //padding: EdgeInsets.all(10.0),
            //shape: RoundedRectangleBorder(
            //  borderRadius: BorderRadius.circular(5.0),
            //),
            //color: Colors.blue,
            child: Text(
              'buttons.submit'.tr(),
              style: kLightButtonTextStyle20,
            ),
          ),
        );
      },
    );
  }

  Widget _buildDividerOr() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: kDefaultPadding * 0.00,
              right: kDefaultPadding * 0.50,
            ),
            child: Divider(
              color: AppConfigColors.white,
              height: 20,
            ),
          ),
        ),
        Text('texts.or'.tr(), style: kFontTextStyle15),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: kDefaultPadding * 0.50,
              right: kDefaultPadding * 0.00,
            ),
            child: Divider(
              color: AppConfigColors.white,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInBtnGoogle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          //decoration: kBoxDecorationStyleLight,
          height: kDefaultPadding * 2.5,
          child: Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 0.00),
            child: SignInButton.mini(
              buttonType: ButtonType.google,
              buttonSize: ButtonSize.large, // small(default), medium, large
              //btnText: 'auth.sign_in_google'.tr(),
              onPressed: () async {
                await controller.storeGoogleSignIn();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'texts.forgot_password'.tr(),
          style: kLabelStyle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF61A8EB),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "assets/images/logos/app_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    'auth.sign_in.page_name'.tr(),
                    style: kFontTextStyle30,
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  _buildEmailTF(),
                  SizedBox(
                    height: kDefaultPadding * 1.0,
                  ),
                  _buildPasswordTF(),
                  _buildForgotPasswordBtn(),
                  _buildSignInBtn(),
                  _buildDividerOr(),
                  SizedBox(
                    height: kDefaultPadding * 1.0,
                  ),
                  _buildSignInBtnGoogle()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

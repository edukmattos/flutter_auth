import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sign_button/sign_button.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _buildEmailTF() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 330,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xFFE6E6E6),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Observer(
                      name: 'observerEmail',
                      builder: (_) {
                        return TextFormField(
                          obscureText: false,
                          autofocus: false,
                          onChanged: controller.changeEmail,
                          keyboardType: TextInputType.emailAddress,
                          style: kFontTextStyle15,
                          decoration: InputDecoration(
                            labelText: 'fields.email'.tr(),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: kDefaultPadding * 0.60,
                                end: kDefaultPadding * 0.50,
                              ),
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
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordTF() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              width: 330,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xFFE6E6E6),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Observer(
                      name: 'observerPassword',
                      builder: (_) {
                        return TextFormField(
                          obscureText: true,
                          autofocus: false,
                          onChanged: controller.changePassword,
                          keyboardType: TextInputType.emailAddress,
                          style: kFontTextStyle15,
                          decoration: InputDecoration(
                            labelText: 'fields.password'.tr(),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Colors.black,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: kDefaultPadding * 0.60,
                                end: kDefaultPadding * 0.50,
                              ),
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
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignInBtn() {
    return Expanded(
      child: Align(
        alignment: Alignment(1, 0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Observer(
            name: 'submitButtonObserver',
            builder: (_) {
              return ElevatedButton(
                onPressed: controller.isFormValid
                    ? () async {
                        controller
                            .authStoreEmailPasswordSignIn(
                          email: controller.email,
                          password: controller.password,
                        )
                            .then((response) {
                          print("ok");
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: tr('auth.password_reset.success'),
                            ),
                          );
                        }).catchError(
                          (error) {
                            showTopSnackBar(
                              context,
                              CustomSnackBar.error(
                                message: error.message,
                              ),
                            );
                          },
                        );
                      }
                    : null,
                child: Text(
                  'buttons.submit'.tr(),
                  style: kLightButtonTextStyle20,
                ),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(12), minimumSize: Size(150, 50)),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDividerOr() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
              left: kDefaultPadding * 0.00,
              right: kDefaultPadding * 0.50,
            ),
            child: Divider(
              color: AppConfigColors.black,
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
              color: AppConfigColors.black,
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
                await controller.authStoreGoogleSignIn().then((response) {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.success(
                      message: tr('auth.success.sign_in'),
                    ),
                  );
                }).catchError(
                  (error) {
                    showTopSnackBar(
                      context,
                      CustomSnackBar.error(
                        message: error.message,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordTxt() {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/password_reset'),
      child: Text(
        'texts.forgot_password'.tr(),
        style: kFontTextStyle15,
      ),
    );
  }

  Widget _buildSignUpTxt() {
    return GestureDetector(
      onTap: () => Modular.to.pushNamed('/sign_up'),
      child: Text(
        'texts.sign_up'.tr(),
        style: kFontTextStyle15,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment(0, 0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        kDefaultPadding * 1,
                        kDefaultPadding * 0,
                        kDefaultPadding * 1,
                        kDefaultPadding * 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: Alignment(0, 0),
                          child: Image.asset(
                            "assets/images/logos/app_logo.png",
                            width: kDefaultWidth,
                            height: kDefaultHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              kDefaultPadding * 0,
                              kDefaultPadding * 2.5,
                              kDefaultPadding * 0,
                              kDefaultPadding * 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'auth.sign_in.page_name'.tr(),
                                style: kFontTextStyle30,
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    kDefaultPadding * 0,
                                    kDefaultPadding * 0,
                                    kDefaultPadding * 0.1,
                                    kDefaultPadding * 0),
                                child: Text(
                                  'auth.sign_in.page_description'.tr(),
                                  textAlign: TextAlign.justify,
                                  style: kFontTextStyle15,
                                ),
                              ),
                            )
                          ],
                        ),
                        _buildEmailTF(),
                        _buildPasswordTF(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(
                                    kDefaultPadding * 0,
                                    kDefaultPadding * 0.75,
                                    kDefaultPadding * 0,
                                    kDefaultPadding * 0),
                                child: _buildForgotPasswordTxt(),
                              ),
                            ),
                            _buildSignInBtn(),
                          ],
                        ),
                        SizedBox(
                          height: kDefaultHeight * 0.2,
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: _buildDividerOr(),
                        ),
                        SizedBox(
                          height: kDefaultHeight * 0.2,
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSignInBtnGoogle(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: kDefaultHeight * 1.5,
                        ),
                        Align(
                          alignment: Alignment(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildSignUpTxt(),
                            ],
                          ),
                        )
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

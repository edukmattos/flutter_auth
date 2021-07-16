import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/config/theme/fonts.dart';
import 'sign_up_store.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key? key, this.title = "SignUpPage"}) : super(key: key);
  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends ModularState<SignUpPage, SignUpStore> {
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

  Widget _buildPasswordConfirmTF() {
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
                      name: 'observerPasswordConfirm',
                      builder: (_) {
                        return TextFormField(
                          obscureText: true,
                          autofocus: false,
                          onChanged: controller.changePasswordConfirm,
                          keyboardType: TextInputType.emailAddress,
                          style: kFontTextStyle15,
                          decoration: InputDecoration(
                            labelText: 'fields.password_confirm'.tr(),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              color: Colors.black,
                            ),
                            suffixIcon: Padding(
                              padding: EdgeInsetsDirectional.only(
                                top: kDefaultPadding * 0.60,
                                end: kDefaultPadding * 0.50,
                              ),
                              child:
                                  controller.validatePasswordConfirm() == null
                                      ? null
                                      : Text(
                                          controller.validatePasswordConfirm()!,
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

  Widget _buildSubmitBtn() {
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
                            .authStoreEmailPassordSignUp(
                          email: controller.email,
                          password: controller.password,
                        )
                            .then((response) {
                          showTopSnackBar(
                            context,
                            CustomSnackBar.success(
                              message: tr('auth.success.sign_up'),
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

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('app.name_short').tr(),
          //Visibility(
          //  visible: true,
          //  child: Text(
          //    ('app.name_short').tr(),
          //    style: TextStyle(fontSize: 12.0),
          //  ),
          //)
        ],
      ),
    );

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
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
                                'auth.sign_up.page_name'.tr(),
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
                                  'auth.sign_up.page_description'.tr(),
                                  textAlign: TextAlign.justify,
                                  style: kFontTextStyle15,
                                ),
                              ),
                            )
                          ],
                        ),
                        _buildEmailTF(),
                        _buildPasswordTF(),
                        _buildPasswordConfirmTF(),
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
                                child: null,
                              ),
                            ),
                            _buildSubmitBtn(),
                          ],
                        ),
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

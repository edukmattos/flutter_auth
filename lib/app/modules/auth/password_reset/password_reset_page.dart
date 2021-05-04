import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/config/theme/fonts.dart';
import 'password_reset_store.dart';

class PasswordResetPage extends StatefulWidget {
  const PasswordResetPage({Key? key}) : super(key: key);
  @override
  PasswordResetPageState createState() => PasswordResetPageState();
}

class PasswordResetPageState
    extends ModularState<PasswordResetPage, PasswordResetStore> {
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

  Widget _buildSubmitBtn() {
    return Observer(
      name: 'submitButtonObserver',
      builder: (_) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 25.0),
          width: double.infinity,
          child: ElevatedButton(
            //elevation: 5.0,
            onPressed: controller.isFormValid
                ? () async {
                    controller
                        .passwordResetStorePasswordReset(
                            email: controller.email.trim())
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

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('auth.sign_in.page_name').tr(),
          Visibility(
            visible: true,
            child: Text(
              ('app.name_short').tr(),
              style: TextStyle(fontSize: 12.0),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
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
                    'auth.password_reset.page_name'.tr(),
                    style: kFontTextStyle30,
                  ),
                  SizedBox(
                    height: kDefaultPadding * 1.5,
                  ),
                  _buildEmailTF(),
                  _buildSubmitBtn(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

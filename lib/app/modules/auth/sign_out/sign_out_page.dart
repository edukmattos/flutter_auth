import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/config/theme/fonts.dart';
import 'sign_out_store.dart';

class SignOutPage extends StatefulWidget {
  const SignOutPage({Key? key}) : super(key: key);
  @override
  SignOutPageState createState() => SignOutPageState();
}

class SignOutPageState extends ModularState<SignOutPage, SignOutStore> {
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
                                'auth.password_reset.page_name'.tr(),
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
                                  'auth.password_reset.page_description'.tr(),
                                  textAlign: TextAlign.justify,
                                  style: kFontTextStyle15,
                                ),
                              ),
                            )
                          ],
                        ),
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

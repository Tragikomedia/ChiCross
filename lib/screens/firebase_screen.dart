import 'package:flutter/material.dart';
import 'package:chinese_picross/firebase/sign_in.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/settings_comps/firebase_text.dart';
import 'package:chinese_picross/screens/empty_loading_screen.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/themes/theme_manager.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flushbar/flushbar.dart';
import 'package:provider/provider.dart';

class FirebaseScreen extends StatefulWidget {
  @override
  _FirebaseScreenState createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  String _userName = currentUserName;

  @override
  Widget build(BuildContext context) {
    bool loggedIn = currentUserName != null;
    var colorSet = ThemeManager.of(context).colorSet;
    var loc = localization[
            Provider.of<PreferencesProvider>(context, listen: false).language]
        ['firebase'];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kPreferredAppBarHeight),
          child: GeneralAppBar(
            text: loc['synchro'],
            textColor: colorSet.strongestColor,
            backgroundColor: colorSet.intermediaryColor,
          )),
      backgroundColor: colorSet.primaryColor,
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FirebaseText(
                text: loggedIn
                    ? '${loc['loggedas']}: $_userName.'
                    : loc['nousers'],
                color: colorSet.secondaryColor,
              ),
              GoogleSignInButton(
                text: loggedIn ? loc['signout'] : loc['signin'],
                onPressed: () async {
                  bool flawlessConnection;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyLoadingScreen()));
                  if (loggedIn) {
                    flawlessConnection = await signOutOfGoogle();
                  } else {
                    flawlessConnection = await signInWithGoogle();
                  }
                  Navigator.pop(context);
                  if (!flawlessConnection) {
                    Flushbar(
                      messageText: FirebaseText(
                        text: loc['error'],
                        color: colorSet.primaryColor,
                      ),
                      backgroundColor: colorSet.strongestColor,
                      duration: Duration(seconds: 2),
                    )..show(context);
                  }
                  setState(() {
                    _userName = currentUserName;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

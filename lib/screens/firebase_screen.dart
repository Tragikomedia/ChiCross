import 'package:flutter/material.dart';
import 'package:chinese_picross/firebase/firebase_manager.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/settings_comps/firebase_text.dart';
import 'package:chinese_picross/components/settings_comps/settings_button.dart';
import 'package:chinese_picross/components/settings_comps/firebase_popup_buttons.dart';
import 'package:chinese_picross/components/shared_comps/popup/base_popup.dart';
import 'package:chinese_picross/components/settings_comps/firebase_info.dart';
import 'package:chinese_picross/screens/empty_loading_screen.dart';
import 'package:chinese_picross/localization/localization.dart';
import 'package:chinese_picross/providers/preferences_provider.dart';
import 'package:chinese_picross/providers/progress_provider.dart';
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
  String _photoURL = currentUserPhoto;

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loggedIn ? CircleAvatar(
                backgroundColor: colorSet.secondaryColor,
                backgroundImage: NetworkImage(_photoURL),
                minRadius: 30.0,
                maxRadius: 30.0,
              ) : CircleAvatar(
                backgroundColor: colorSet.secondaryColor,
                minRadius: 30.0,
                maxRadius: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: FirebaseText(
                  text: loggedIn
                      ? '${loc['loggedas']}: $_userName.'
                      : loc['nousers'],
                  color: colorSet.secondaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                child: loggedIn ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: SettingsButton(
                        text: loc['sync'],
                        textColor: colorSet.intermediaryColor,
                        backgroundColor: colorSet.strongestColor,
                        onPressed: () async {
                          await synchronizeDatabases(Provider.of<ProgressProvider>(context, listen: false).completenessTracker);
                          Provider.of<ProgressProvider>(context, listen: false).saveSynchronizedData();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                      child: SettingsButton(
                        text: loc['erase'],
                        textColor: colorSet.intermediaryColor,
                        backgroundColor: colorSet.strongestColor,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => BasePopup(
                                choiceWidget: FirebasePopupButtons(
                                  textColor: colorSet.primaryColor,
                                  backgroundColor: colorSet.secondaryColor,
                                ),
                                textWidget: FirebaseText(
                                  text: loc['erasemessage'],
                                  color: colorSet.strongestColor,
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ) : SizedBox.shrink(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleSignInButton(
                    text: loggedIn ? loc['signout'] : loc['signin'],
                    onPressed: () async {
                      bool flawlessConnection;
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyLoadingScreen()));
                      if (loggedIn) {
                        flawlessConnection = await signOutOfGoogle();
                      } else {
                        flawlessConnection = await signInWithGoogle();
                        await initializeDatabase(Provider.of<ProgressProvider>(context, listen: false).completenessTracker.length);
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
                        _photoURL = currentUserPhoto;
                      });
                    },
                  ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: FirebaseInfo(),
                    )]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

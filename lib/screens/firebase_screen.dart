import 'package:flutter/material.dart';
import 'package:chinese_picross/firebase/sign_in.dart';
import 'package:chinese_picross/utilities/general_utils/constants.dart';
import 'package:chinese_picross/components/shared_comps/app_bar/general_app_bar.dart';
import 'package:chinese_picross/components/settings_comps/firebase_text.dart';
import 'package:chinese_picross/components/settings_comps/settings_button.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    FirebaseText(
                      text: loggedIn
                          ? '${loc['loggedas']}: $_userName.'
                          : loc['nousers'],
                      color: colorSet.secondaryColor,
                    ),
                  ],
                )
              ),
              // TODO onpressed
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    loggedIn ? SettingsButton(
                      text: loc['sync'],
                      textColor: colorSet.intermediaryColor,
                      backgroundColor: colorSet.strongestColor,
                      onPressed: () {
                        synchronizeDatabases(Provider.of<ProgressProvider>(context, listen: false).completenessTracker);
                      },
                    ) : SizedBox.shrink(),
                    loggedIn ? SettingsButton(
                      text: loc['erase'],
                      textColor: colorSet.intermediaryColor,
                      backgroundColor: colorSet.strongestColor,
                      onPressed: () {
                        deleteFirestoreDatabase(Provider.of<ProgressProvider>(context, listen: false).completenessTracker.length);
                      },
                    ) : SizedBox.shrink(),
                  ],
                ),
              ),
              MediaQuery.of(context).orientation == Orientation.portrait ? Flexible(
                child: FirebaseText(
                  color: colorSet.secondaryColor,
                  text: loc['text'],
                ),
              ) : SizedBox.shrink(),
              Flexible(
                child: GoogleSignInButton(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

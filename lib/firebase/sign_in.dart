import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<bool> signInWithGoogle() async {
  try {
    final GoogleSignInAccount account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuthentication = await account
        .authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken
    );
    final authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> signOutOfGoogle() async {
  try {
    await _googleSignIn.signOut();
    await _auth.signOut();
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

get currentUserName {
  if (_auth.currentUser != null) {
    return _auth.currentUser.displayName;
  } else {
    return null;
  }
}
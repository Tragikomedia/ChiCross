import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

Future<void> synchronizeDatabases(List completenessTracker) async {
  if (_auth.currentUser == null) {
    return;
  }
  try {
    await initializeDatabase(completenessTracker.length);
    await mergeLocalAndExternalDb(completenessTracker);
  } catch (e) {
    print(e);
  }
  return;
}

Future<void> initializeDatabase(int numberOfGames) async {
  var docRef = _firestore.collection('progress').doc(_auth.currentUser.uid);
  var snapshot = await docRef.get();
  if (snapshot.exists) {
    return;
  }
  Map<String, dynamic> progressToBeSaved = {};
  for (int i = 0; i < numberOfGames; i++) {
    progressToBeSaved[i.toString()] = false;
  }
  await docRef.set(progressToBeSaved, SetOptions(merge: true));
  return;
}

Future<void> mergeLocalAndExternalDb(List completenessTracker) async {
  var docRef = _firestore.collection('progress').doc(_auth.currentUser.uid);
  var snapshot = await docRef.get();
  var data = snapshot.data();
  Map<String, dynamic> progressToBeSaved = {};
  for (int i = 0; i < completenessTracker.length; i++) {
    if (data[i.toString()]) {
      completenessTracker[i] = true;
    } else if (completenessTracker[i] && !data[i.toString()]) {
      progressToBeSaved[i.toString()] = true;
    }
  }
  if (progressToBeSaved.isNotEmpty) {
    await docRef.update(progressToBeSaved);
  }
  return;
}

void deleteFirestoreDatabase(int numberOfGames) async {
  if (_auth.currentUser == null) {
    return;
  }
  await _firestore.collection('progress').doc(_auth.currentUser.uid).delete();
  await initializeDatabase(numberOfGames);
}

void saveUserProgressInFirestore(int gameNumber) async {
  if (_auth.currentUser == null) {
    return;
  }
  await _firestore.collection('progress').doc(_auth.currentUser.uid).update({gameNumber.toString() : true});
}

get currentUserName {
  if (_auth.currentUser != null) {
    return _auth.currentUser.displayName;
  } else {
    return null;
  }
}

get currentUserPhoto {
  if (_auth.currentUser != null) {
    return _auth.currentUser.photoURL;
  } else {
    return null;
  }
}
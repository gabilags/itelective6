import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:itelective61/shared/reg_users.dart';

// ignore: camel_case_types
class Firebase_Authentication {
  RegUsers currentUser;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  final CollectionReference regUsersCollection =
      FirebaseFirestore.instance.collection("regusers");
  final CollectionReference itemsCollection =
      FirebaseFirestore.instance.collection("items");

  Firebase_Authentication(
      {FirebaseAuth? auth, GoogleSignIn? googleSignIn, RegUsers? loginUser})
      : _auth = auth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn(),
        currentUser = loginUser ?? RegUsers();

  RegUsers userFromFirebaseUser(User user) {
    return RegUsers(
      uid: user.uid,
      email: user.email ?? "",
      displayname: user.displayName ?? "",
      photoUrl: user.photoURL ?? "",
      display: false,
    );
  }

  Stream<RegUsers> get getUser {
    return _auth.authStateChanges().map((user) {
      return userFromFirebaseUser(user!);
    }).handleError((error) {
      return RegUsers();
    });
  }

  Future<RegUsers> signInAnonymously() async {
    final authResult = await _auth.signInAnonymously();
    return userFromFirebaseUser(authResult.user!);
  }

  Future loginwithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await _auth.signInWithCredential(credential);

      final User? user = result.user;

      final User? currentUser = _auth.currentUser;
      assert(user!.uid == currentUser!.uid);

      RegUsers loginUser = RegUsers();
      loginUser = userFromFirebaseUser(user!);

      // Data Collection
      DocumentSnapshot ds = await FirebaseFirestore.instance
          .collection("regusers")
          .doc(loginUser.uid)
          .get();
      if (ds.exists) {
        loginUser.display = ds["display"];
      } else {
        await regUsersCollection.doc(loginUser.uid).set({
          "displayname": loginUser.displayname,
          "email": loginUser.email,
          "photoUrl": loginUser.photoUrl,
          "display": true,
        });
      }

      // ignore: avoid_print
      print(loginUser.displayname);
      this.currentUser = loginUser;

      return loginUser;
    } catch (e) {
      return null;
    }
  }

  Future<void> logOut(BuildContext context) async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  //Streaming of item list
  Stream<List<RegUsers>> getUsers() {
    return FirebaseFirestore.instance
        .collection("regusers")
        .where("display", isEqualTo: true)
        .snapshots()
        .map(getUsersSnap);
  }

  //Mapping of item list
  List<RegUsers> getUsersSnap(QuerySnapshot snapshots) {
    return snapshots.docs.map((doc) {
      return RegUsers(
        uid: doc.id,
        display: doc.get('display') ?? true,
        displayname: doc.get('displayname'),
        email: doc.get('email'),
        photoUrl: doc.get('photoUrl'),
      );
    }).toList();
  }
}

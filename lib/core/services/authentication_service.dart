import 'package:compound/core/models/user.dart';
import 'package:compound/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:compound/core/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService=locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      await _populateCurrentUser(authResult.user); // Populate the user information
      return authResult.user != null;

    } catch (e) {
      return e.message;
    }
  }
  Future signUpWithEmail({
    @required String email,
    @required String password,
    @required String fullName,
    @required String role,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      _currentUser=User(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          userRole: role,
      );
      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
  Future<bool> isUserLoggedIn() async{
    var user = await _firebaseAuth.currentUser();
    await _populateCurrentUser(user); // Populate the user information
    return user != null;
  }

}
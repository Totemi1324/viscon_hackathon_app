import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_credentials.dart';

class AuthenticationService extends Cubit<UserCredentials> {
  final _auth = FirebaseAuth.instance;

  UserCredential? _credentials;

  /*static AuthenticationError _firebaseErrorCodes(String errorCode) {
    switch (errorCode) {
      case "email-already-in-use":
        return AuthenticationError.emailExists;
      case "weak-password":
        return AuthenticationError.weakPassword;
      case "TOO_MANY_ATTEMPTS_TRY_LATER":
        return AuthenticationError.tooManyAttempts;
      case "user-not-found":
        return AuthenticationError.userNotFound;
      case "wrong-password":
        return AuthenticationError.wrongPassword;
      case "user-disabled":
        return AuthenticationError.userDisabled;
      default:
        return AuthenticationError.unknown;
    }
  }*/

  Timer? _logoutTimer;

  AuthenticationService() : super(UserCredentials.empty()) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        emit(
          UserCredentials(
            userId: user.uid,
            userEmail: user.email,
            lastSignedIn: user.metadata.lastSignInTime,
          ),
        );
      } else {
        emit(UserCredentials.empty());
      }
    });
  }

  bool get isAuthenticated => state.userId != "";

  Future attemptSignUp(String email, String password) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    _credentials = credential;
  }

  Future attemptLogIn(String email, String password) async {
    final credentials = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _credentials = credentials;
  }

  Future<bool> attemptAutoLogIn() async {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      return false;
    }

    emit(
      UserCredentials(
        userId: currentUser.uid,
        userEmail: currentUser.email,
        lastSignedIn: currentUser.metadata.lastSignInTime,
      ),
    );

    return true;
  }

  Future logOut() async {
    if (_logoutTimer != null) {
      _logoutTimer!.cancel();
      _logoutTimer = null;
    }

    await _auth.signOut();

    emit(UserCredentials.empty());
  }

  // Neu: Future<bool> sendConfirmationEmail() async
  Future sendVerificationEmail() async {
    User? user;
    user = _auth.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    }
  }

  // Neu: Future<bool> isUserConfirmed()
  bool isUserVerified() {
    User? user;
    user = _auth.currentUser;
    if (user != null) {
      return user.emailVerified;
    }
    return false;
  }
}

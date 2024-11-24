import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';

class Signinrepo {
  Future<void> signIn(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );

      if (result.isSignedIn) {
        print('User signed in');
      } else {
        print('Sign in failed');
      }
    } catch (e) {
      print('Sign in failed: $e');
    }
  }

  Future<AuthSession> isUserLogedIn() {
    return Amplify.Auth.fetchAuthSession();
  }

  Future<AuthUser> getCurrentUser() {
    return Amplify.Auth.getCurrentUser();
  }

  Future<void> signOut() async {
    try {
      await Amplify.Auth.signOut();
    } catch (e) {
      print('Sign out failed: $e');
    }
  }
}

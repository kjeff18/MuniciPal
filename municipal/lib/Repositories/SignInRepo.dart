import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';

class SignInRepo {
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

  Future<Either<String, SignOutResult>> signOut() async {
    try {
      final result = await Amplify.Auth.signOut();
      return Right(result);
    } catch (e) {
      print('Sign out failed: $e');
      return Left('Sign out failed: $e');
    }
  }
}

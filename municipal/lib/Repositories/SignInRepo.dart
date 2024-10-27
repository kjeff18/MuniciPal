import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
class Signinrepo {
Future <Either<String, SignInResult>> signIn 
({required String email, required String password})
async {
  try {
    final result = await Amplify.Auth.signIn(
      username: email,
      password: password
    );
  return right(result);
  } on AuthException catch (e)
  {
    return left(e.message);
  } 
}

  Future<AuthSession> isUserLogedIn() {
    return Amplify.Auth.fetchAuthSession();
  }


  Future<AuthUser> getCurrentUser() {
    return Amplify.Auth.getCurrentUser();
  }


  Future<SignOutResult> signOut() {
    return Amplify.Auth.signOut();
  }
}
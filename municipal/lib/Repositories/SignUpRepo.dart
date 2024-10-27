import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';

class SignUpRepo {
  Future<Either<String, SignUpResult>> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
    String street,
    String city,
    String state,
    String zipCode,
  ) async {
    final Map<AuthUserAttributeKey, String> userAttributes = {
      AuthUserAttributeKey.email: email,
      AuthUserAttributeKey.givenName: firstName,
      AuthUserAttributeKey.familyName: lastName,
      CognitoUserAttributeKey.custom('street') : street,
      CognitoUserAttributeKey.custom('city') : city,
      CognitoUserAttributeKey.custom('state') : state,
      CognitoUserAttributeKey.address : zipCode,
    };

    try {
      final result = await Amplify.Auth.signUp(
        username: email,
        password: password,
        options: SignUpOptions(userAttributes: userAttributes),
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, bool>> confirmSignUp(
      {required String email, required String code}) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: code,
      );
      return Right(result.isSignUpComplete);
    } on AuthException catch (e) {
      return Left(e.message);
    }
  }
}

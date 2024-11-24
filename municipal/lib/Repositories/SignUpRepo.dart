import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dartz/dartz.dart';
import 'package:municipal/model/SignUpData.dart';

class SignUpRepo {
  Future<Either<String, SignUpResult>> signUp(SignUpData signUpData) async {
    final Map<AuthUserAttributeKey, String> userAttributes = {
      AuthUserAttributeKey.email: signUpData.email,
      AuthUserAttributeKey.givenName: signUpData.firstName,
      AuthUserAttributeKey.familyName: signUpData.lastName,
      AuthUserAttributeKey.name:
          '${signUpData.firstName} ${signUpData.lastName}',
      AuthUserAttributeKey.preferredUsername: signUpData.email,
      CognitoUserAttributeKey.address:
          signUpData.formattedAddress, // Use formatted address
    };

    try {
      final result = await Amplify.Auth.signUp(
        username: signUpData.email,
        password: signUpData.password,
        options: SignUpOptions(userAttributes: userAttributes),
      );
      return right(result);
    } on AuthException catch (e) {
      return left(e.message);
    }
  }

  Future<Either<String, SignUpResult>> confirmSignUp(
      String email, String code) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
        username: email,
        confirmationCode: code,
      );

      return Right(result);
    } on AuthException catch (e) {
      return Left(e.message);
    }
  }
}

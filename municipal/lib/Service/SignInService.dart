import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:municipal/Repositories/SignInRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class SignInService with ChangeNotifier {

  SignInService(this._signInRepo);
  AuthUser? _currentUser;
  bool _isLoading = false;


  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _currentUser;


  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }


  final Signinrepo _signInRepo;

    Future<Either<String, SignInResult>> SignIn (String email, String password) async
  {
    _setIsLoading(true);
    try{
      SignInResult result = await Amplify.Auth.signIn(
        username: email,
        password: password );

      final user = await _signInRepo.getCurrentUser();
      _currentUser = user;
      _setIsLoading(false);

        return Right(result);

    }
    on AuthException catch (e)
    {
      return Left(e.message);
    
    }
    catch (e)
    {
      return Left('An unexpected error occured: ${e.toString()} ');
    }
  }
  
  Future<Either<String, SignOutResult>> signOut() async {
    _setIsLoading(true);
    try {
      final response = await _signInRepo.signOut();
      _currentUser = null;
      _setIsLoading(false);
      return right(response);
    } on AuthException catch (e) {
      _setIsLoading(false);
      return left(e.message); 
    }
  }

}
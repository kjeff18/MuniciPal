import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:municipal/Repositories/SignUpRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';


class SignUpService with ChangeNotifier 
{
  final SignUpRepo _signUpRepo;

  SignUpService(this._signUpRepo);
  AuthUser? _currentUser;
  bool _isLoading = false;


  bool get isLoading => _isLoading;
  AuthUser? get currentUser => _currentUser;


  void _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future <Either< String, SignUpResult>> signUp (
    String firstName,
    String lastName,
    String email,
    String password,
    String street, 
    String city, 
    String state,
    String zipCode,
  ) async
  {
    _setIsLoading(true);
    try{
      final result = await _signUpRepo.signUp(firstName, lastName, email, password, street, city, state, zipCode);
      return result; 
    } on AuthException catch (e)
    {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
    finally{
      _setIsLoading(false);
    }
  }

  Future<Either<String, bool>> confirmSignUp ({
    required String email, 
    required String code,
  }) async
  {
    _setIsLoading(true);
    try{
      final result = await _signUpRepo.confirmSignUp(email: email, code: code);
      return result;
    }
    on AuthException catch (e)
    {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
    finally{
      _setIsLoading(false);
    }
  }

}
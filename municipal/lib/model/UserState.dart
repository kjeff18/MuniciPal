import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class UserState with ChangeNotifier {
  AuthUser? _authUser;
  bool _isLoading = true;

  AuthUser? get authUser => _authUser;
  bool get isLoading => _isLoading;

  Future<void> loadCurrentUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      final user = await Amplify.Auth.getCurrentUser();
      _authUser = user;
    } catch (e) {
      _authUser = null;
      print('Error loading current user: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearUser() {
    _authUser = null;
    notifyListeners();
  }
}

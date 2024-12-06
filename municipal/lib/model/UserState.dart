import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class UserState with ChangeNotifier {
  AuthUser? _authUser;
  Map<String, String>? _userAttributes; // Store user attributes
  bool _isLoading = true;

  AuthUser? get authUser => _authUser;
  Map<String, String>? get userAttributes => _userAttributes;
  bool get isLoading => _isLoading;

  Future<void> loadCurrentUser() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch the current user
      final user = await Amplify.Auth.getCurrentUser();
      _authUser = user;

      // Fetch user attributes
      final attributes = await Amplify.Auth.fetchUserAttributes();
      _userAttributes = {
        for (var attr in attributes) attr.userAttributeKey.key: attr.value,
      };

      // Debugging print statement to verify attributes
      print('User attributes: $_userAttributes');
    } catch (e) {
      _authUser = null;
      _userAttributes = null;
      print('Error loading current user: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  String? getUserName() {
    // Return the name attribute, or null if not available
    return _userAttributes?['name'];
  }

  void clearUser() {
    _authUser = null;
    _userAttributes = null;
    notifyListeners();
  }
}

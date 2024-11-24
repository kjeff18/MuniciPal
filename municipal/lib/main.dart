import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'amplifyconfiguration.dart';
import 'Page/WelcomePage.dart';
import 'Page/LandingPage.dart';
import 'package:provider/provider.dart';
import 'Service/SignUpService.dart';
import 'Repositories/SignUpRepo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);

  try {
    await Amplify.configure(amplifyconfig);
    print('Amplify configured successfully');
  } catch (e) {
    print('Amplify configuration failed: $e');
  }

  runApp(
    MultiProvider(
      providers: [
        // Provide SignUpService as a dependency
        ChangeNotifierProvider(
          create: (_) => SignUpService(SignUpRepo()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool>(
        future: _isUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while checking auth state
            return const CircularProgressIndicator();
          } else if (snapshot.data == true) {
            // Redirect to the home page if the user is logged in
            return LandingPage();
          } else {
            // Redirect to the sign-in page if the user is not logged in
            return WelcomePage();
          }
        },
      ),
    );
  }

  Future<bool> _isUserLoggedIn() async {
    try {
      await Amplify.Auth.getCurrentUser();
      return true; // If no exception is thrown, a user is signed in.
    } catch (e) {
      return false; // If an exception is thrown, no user is signed in.
    }
  }
}

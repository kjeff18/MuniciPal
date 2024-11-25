import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:amplify_api/amplify_api.dart';
import 'amplifyconfiguration.dart';
import 'Page/WelcomePage.dart';
import 'CustomBottomNavigationBar.dart';
import 'package:provider/provider.dart';
import 'Service/SignUpService.dart';
import 'Repositories/SignUpRepo.dart';
import 'Service/SignInService.dart';
import 'Repositories/SignInRepo.dart';
import 'model/UserState.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authPlugin = AmplifyAuthCognito();
  final apiPlugin = AmplifyAPI();
  final storagePlugin = AmplifyStorageS3();

  await Amplify.addPlugins([authPlugin, apiPlugin, storagePlugin]);

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
        ChangeNotifierProvider(
          create: (_) => SignInService(SignInRepo()),
        ),
        ChangeNotifierProvider(
          create: (_) => UserState()..loadCurrentUser(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserState>(
      builder: (context, userState, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: _buildHome(userState),
        );
      },
    );
  }

  Widget _buildHome(UserState userState) {
    if (userState.isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (userState.authUser != null) {
      return const CustomBottomNavigationBar();
    } else {
      return const WelcomePage();
    }
  }
}

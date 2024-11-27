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
import 'models/ModelProvider.dart';
import 'Helper/UserLocation.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Capture uncaught Flutter framework and Dart errors
  runZonedGuarded(() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      // Log Flutter framework errors
      FlutterError.dumpErrorToConsole(details);
      log('FlutterError: ${details.exceptionAsString()}');
    };
    CacheManager.logLevel = CacheManagerLogLevel.debug;

    // Initialize Amplify plugins
    final authPlugin = AmplifyAuthCognito();
    final apiPlugin = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    final storagePlugin = AmplifyStorageS3();

    try {
      await Amplify.addPlugins([authPlugin, apiPlugin, storagePlugin]);
      await Amplify.configure(amplifyconfig);
      log('Amplify configured successfully');
    } catch (e) {
      log('Amplify configuration failed: $e');
    }

    // Run the app
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => SignUpService(SignUpRepo()),
          ),
          ChangeNotifierProvider(
            create: (_) => SignInService(SignInRepo()),
          ),
          ChangeNotifierProvider(
            create: (_) => UserState()..loadCurrentUser(),
          ),
          ChangeNotifierProvider(create: (_) => UserLocation()),
        ],
        child: const MyApp(),
      ),
    );
  }, (error, stackTrace) {
    // Log any uncaught Dart errors
    log('Uncaught error: $error', stackTrace: stackTrace);
    debugPrint('Uncaught error: $error');
    debugPrint(stackTrace.toString());
  });
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

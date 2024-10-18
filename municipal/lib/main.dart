import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DesingContstant.dart';
import 'LoginPage/SignInPage.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

// Future<void> main() async {
//   try {
//     WidgetsFlutterBinding.ensureInitialized();
//     await _configureAmplify();
//     runApp(const MyApp());
//   } on AmplifyException catch (e) {
//     runApp(Text("Error configuring Amplify: ${e.message}"));
//   }
// }

// Future<void> _configureAmplify() async {
//   try {
//     await Amplify.addPlugin(AmplifyAuthCognito());
//     await Amplify.configure(amplifyConfig);
//     safePrint('Successfully configured');
//   } on Exception catch (e) {
//     safePrint('Error configuring Amplify: $e');
//   }
// }

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Authenticator(
        child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      title: 'Municipal',
        theme: ThemeData(
          primaryColor: primaryColor,
          primaryTextTheme:
            TextTheme(
              headlineMedium: textFont.copyWith(color: textColor, fontSize:HeadlineSize ),
              displaySmall: textFont.copyWith(color: textColor, fontSize:hintTextSize ),
              bodyMedium: textFont.copyWith(color: textColor, fontSize: bodyTextSize )
            )

        ),
      home: SignInPage()
    );
  }
}

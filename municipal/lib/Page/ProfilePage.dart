import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/ProfilePageWidget/ProfilePageAppBar.dart';
import 'package:municipal/Page/WelcomePage.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:municipal/Service/SignInService.dart';
import 'package:provider/provider.dart';
import 'package:municipal/model/UserState.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final userAttributes;

  @override
  void initState() {
    super.initState();
    // Fetch the UserState from the context here
    userAttributes =
        Provider.of<UserState>(context, listen: false).userAttributes;
  }

  void logOutFunc() {
    Provider.of<SignInService>(context, listen: false).signOut();

    // Replace current page with WelcomePage
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  void changePasswordFunc() {}
  void deleteAccountFunc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          ProfilePageAppBar(),
          const SizedBox(height: 10), // Space for profile picture
          Text(
            userAttributes?['name'] ?? '',
            style:
                TextStyle(fontSize: HeadlineSize, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(
            Icons.email,
            userAttributes?['email'] ?? '',
          ),
          const Divider(indent: 50, endIndent: 16),
          _buildInfoRow(
            Icons.location_on,
            userAttributes?['address'] ?? '',
          ),
          const Divider(indent: 50, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const Icon(Icons.lock, color: hintTextColor),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => changePasswordFunc,
                  child: Text(
                    'Change Password?',
                    style: textFont.copyWith(
                        fontSize: bodyTextSize, color: accentColor),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
          CustomButton(text: "Logout", onPressed: logOutFunc, blueButton: true),
          TextButton(
            onPressed: () => deleteAccountFunc,
            child: const Text(
              'Delete Account',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: hintTextColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16.0), // Adjust the left padding as needed
              child: Text(
                value,
                style:
                    textFont.copyWith(color: textColor, fontSize: bodyTextSize),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

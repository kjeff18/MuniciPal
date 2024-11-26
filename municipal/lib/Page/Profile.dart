import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:municipal/widgets/ProfilePageWidget/ProfilePageAppBar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Profile extends StatelessWidget {
  Profile({super.key});

  final String username ='Dina Taing';
  final String emialAddress = 'dina@xxx.com';
  final String streetAddress = '123 XXXX';
  final String city = 'Baton Rouge';

  void logOutFunc()
  {

  }

  void changePasswordFunc()
  {

  }
  void deleteAccountFunc()
  {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: backgroundColor,
      body: Column(
        children: [
          ProfilePageAppBar(),
         const SizedBox(height: 60), // Space for profile picture
           Text(
            username,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildInfoRow(Icons.email, 'Email', emialAddress,),
         const Divider(indent: 50, endIndent: 16),
          _buildInfoRow(Icons.location_on, 'Address', '$streetAddress, $city' , ),
         const Divider(indent: 50, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
               const Icon(Icons.lock),
               const SizedBox(width: 16),
                GestureDetector(
                  onTap: () => changePasswordFunc,
                  child:  Text(
                    'Change Password?',
                    style: textFont.copyWith(fontSize: bodyTextSize, color: accentColor),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
        CustomButton(text: "Logout", onPressed: () => logOutFunc , blueButton: true),
        const  SizedBox(height: 10),
          TextButton(
            onPressed: () => deleteAccountFunc,
            child: const Text(
              'Delete Account',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),

        const  SizedBox(height: 20),
        ],
      ),
    );
  }






  Widget _buildInfoRow(IconData icon, String title, String value,) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 16),
          Text(
            title,
            style: textFont.copyWith(color: textColor, fontSize: bodyTextSize),
          ),
        const  SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: textFont.copyWith(color: textColor, fontSize: bodyTextSize),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
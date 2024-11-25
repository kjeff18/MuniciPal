import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:municipal/Profile/Profile.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:municipal/widgets/WelcomeButton.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Profile extends StatelessWidget {
  Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue background with back and edit icons
          Stack(
            children: [
              Container(
                height: 150,
                color: secondaryColor,
              ),
              Positioned(
                top: 40,
                left: 16,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: BackgroundColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Positioned(
                top: 40,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.edit, color: BackgroundColor),
                  onPressed: () {
                    // Edit profile action
                  },
                ),
              ),
              // Profile picture
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Placeholder image
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 60), // Space for profile picture

          // User name
          Text(
            'User Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          // User details (email, address, change password)
          SizedBox(height: 20),
          _buildInfoRow(Icons.email, 'Email', 'user@example.com', textColor: textColor),
          Divider(indent: 50, endIndent: 16),
          _buildInfoRow(Icons.location_on, 'Address', '123 Main St, City', textColor: textColor),
          Divider(indent: 50, endIndent: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.lock),
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    // Action for Change Password click
                  },
                  child: Text(
                    'Change Password?',
                    style: TextStyle(fontSize: 18, color: ButtonColor), // Blue text
                  ),
                ),
              ],
            ),
          ),

          Spacer(),

          // Logout button
          ElevatedButton(
            onPressed: () {
              // Logout action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ButtonColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 10),

          // Delete Account option
          TextButton(
            onPressed: () {
              // Delete account action
            },
            child: Text(
              'Delete Account',
              style: TextStyle(fontSize: 16, color: Colors.red),
            ),
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value,
      {Color textColor = textColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          SizedBox(width: 16),
          Text(
            title,
            style: TextStyle(fontSize: 18, color: textColor),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18, color: textColor),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
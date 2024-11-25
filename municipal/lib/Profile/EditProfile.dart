import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:municipal/Profile/Profile.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:municipal/widgets/WelcomeButton.dart';
import 'package:flutter_svg/flutter_svg.dart';


class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Blue background with back icon
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

          // Text fields for user input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(nameController, 'Full Name'),
                SizedBox(height: 16),
                _buildTextField(emailController, 'Email'),
                SizedBox(height: 16),
                _buildTextField(addressController, 'Address'),
                SizedBox(height: 16),

                // State and Zip Code row
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(stateController, 'State'),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: _buildTextField(zipCodeController, 'Zip Code'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Spacer(),

          // Update button
          ElevatedButton(
            onPressed: () {
              // Update action
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ButtonColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              'Update',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }
}
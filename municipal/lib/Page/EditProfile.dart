import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:municipal/Page/Profile.dart';
import 'package:municipal/widgets/CustomTextField.dart';
import 'package:municipal/widgets/EditAccountPageWidgets/EditAccountPageAppBar.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:municipal/widgets/CustomButton.dart';
import 'package:flutter_svg/flutter_svg.dart';


class EditProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  void UpdateButtonFunc ()
  {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
         EditAccountPageAppBar(),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(hintText: "Full Name", controller: nameController, icon: Icon(Icons.account_box_rounded) ),
                 const SizedBox(height: 16),
                CustomTextField(hintText: "Email", controller: emailController, icon: Icon(Icons.mail)),
                const SizedBox(height: 16),
                CustomTextField(hintText: "Address", controller: addressController, icon: Icon(Icons.location_on)),
               const  SizedBox(height: 16),

                // State and Zip Code row
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(hintText: "State", controller: stateController, icon: Icon(Icons.map)),
                    ),
                const  SizedBox(width: 16),
                    Expanded(
                      child: CustomTextField(hintText: "Zip Code", controller: zipCodeController, icon: Icon(Icons.pin_drop)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Spacer(),

          CustomButton(text: "Update", onPressed: () => UpdateButtonFunc , blueButton: true),
          const SizedBox(height: 20),
        ],
      ),
    );
  }


}
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Page/EditProfile.dart';

class ProfilePageAppBar extends StatelessWidget {
  const ProfilePageAppBar({super.key});

  void editAccountFunc(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          color: secondaryColor,
        ),
        Positioned(
          top: 60,
          left: 16,
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: accentColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Positioned(
          top: 60,
          right: 16,
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              color: accentColor,
              size: 30,
            ),
            onPressed: () => editAccountFunc(context),
          ),
        ),
        // Profile picture
        const Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 70),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    "assets/logo/UserIconElement.png"), // Correct usage of AssetImage
              ),
            ],
          ),
        ),
      ],
    );
  }
}

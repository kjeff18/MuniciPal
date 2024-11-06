import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool showBackButton;
  final bool showBellIcon;
  final bool showEditProfileIcon; 
  final VoidCallback? onPressed;

  const CustomAppBar({
    Key? key,
    required this.title, 
    this.showBackButton = false,
    this.showBellIcon = false,
    this.showEditProfileIcon = false,
    this.onPressed, // onPressed is required only if either showBellIcon or showEditProfileIcon is true
  })  : assert(
          (showBellIcon || showEditProfileIcon) == false || onPressed != null,
          'onPressed must be provided if showBellIcon or showEditProfileIcon is true'),
        super(key: key);

 @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
   return AppBar(
    backgroundColor: secondaryColor,
    title: Text(title),
    titleTextStyle: textFont.copyWith(color: ButtonColor, fontSize: HeadlineSize),
    centerTitle: true,
    leading: showBackButton ? IconButton(
      onPressed: () {
        Navigator.pop(context);},

     icon: Icon(Icons.arrow_back),
     color: ButtonColor,
     ): 
     null,
   actions: (showBellIcon || showEditProfileIcon) ? [
    IconButton(
      icon: showBellIcon? Icon(Icons.notifications): Icon(Icons.edit), 
      onPressed: onPressed,
    ),
   ]: null,
   );
  }
  

}
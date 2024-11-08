import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Page/IssueCategory.dart';
import 'package:municipal/Page/WelcomePage.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  final int initialIndex; 
  

  const CustomBottomNavigationBar({
    Key? key,
    this.initialIndex = 0,
    }) : super(key: key);

  @override
  _CustomNavigationBar createState() => _CustomNavigationBar();
}



class _CustomNavigationBar extends State<CustomBottomNavigationBar> {
   late int _currentIndex;
  List<Widget> _pages = [ const IssueCategoryPage(), const WelcomePage() ];

@override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: IndexedStack(
      index: _currentIndex,
      children: _pages,
    ),
    bottomNavigationBar: ClipRect(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          iconSize: 40.0,
          backgroundColor: backgroundColor, // Make transparent for gradient
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_rounded),
              label: 'Issue Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          selectedItemColor: accentColor,
          unselectedItemColor: secondaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    ),
  );
}

}
import 'package:flutter/material.dart';
import 'package:municipal/DesingContstant.dart';
import 'package:municipal/Page/IssueCategoryPage.dart';
import 'package:municipal/Page/WelcomePage.dart';
import 'package:municipal/Page/LandingPage.dart';

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
  List<Widget> _pages = [
    const LandingPage(),
    const IssueCategoryPage(),
  ];

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
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, 
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          iconSize: 45.0, 
          backgroundColor: backgroundColor,
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: bottomNavIconScale, 
                child: const Icon(Icons.home),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale:bottomNavIconScale,
                child: const Icon(Icons.assignment_rounded),
              ),
              label: 'Issue Report',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: bottomNavIconScale,
                child: const Icon(Icons.newspaper),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Transform.scale(
                scale: bottomNavIconScale,
                child: const Icon(Icons.account_circle),
              ),
              label: 'Account',
            ),
          ],
          selectedItemColor: accentColor,
          unselectedItemColor: secondaryColor,
          showUnselectedLabels: false,
          showSelectedLabels: false,
        ),
      ),
    );
  }
}

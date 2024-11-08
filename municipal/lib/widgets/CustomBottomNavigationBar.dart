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
  List<Widget> _pages = [ IssueCategoryPage(), WelcomePage() ];

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
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30.0, 
        backgroundColor: secondaryColor,
       

        items: [
           BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assignment_rounded,
            ),
            label: 'Issue Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Account',
          ),
        ],
        selectedItemColor: accentColor,
        unselectedItemColor: secondaryColor,
        elevation: 0,
      ),

    );
  }
}
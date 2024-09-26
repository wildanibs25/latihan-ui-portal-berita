import 'package:flutter/material.dart';
import 'package:inputdata/fragments/home.dart';
import 'package:inputdata/fragments/input.dart';
import 'package:inputdata/pages/login.dart';
import 'package:inputdata/fragments/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainNavigation extends StatefulWidget {
  MainNavigation({super.key, this.login = null});
  var login;

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  List<Widget> _widgetOption = <Widget>[
    Home(),
    Profile(),
    InputData(),
    Text("Fragment Cusromer"),
  ];

  List<String> _navigasi = ["Home", "Profile", "Input", "Customer"];

  int _selectIndex = 0;

  void _onTap(int index) {
    setState(
      () {
        _selectIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          _navigasi.elementAt(_selectIndex),
        ),
        actions: [
          widget.login == null
              ? IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  icon: Icon(Icons.person_3_outlined),
                )
              : Row(
                  children: [
                    Text(
                      widget.login['nama'],
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        icon: Icon(Icons.settings_accessibility_outlined))
                  ],
                )
        ],
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectIndex,
        backgroundColor: Colors.transparent,
        color: Colors.blueAccent,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          Icon(
            Icons.input,
            color: Colors.white,
          ),
          Icon(
            Icons.people,
            color: Colors.white,
          ),
        ],
        onTap: (index) => _onTap(index),
      ),
    );
  }
}

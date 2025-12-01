import 'package:firstflutter/screen/explore.dart';
import 'package:firstflutter/screen/home.dart';
import 'package:firstflutter/screen/profile.dart';
import 'package:firstflutter/screen/task.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    ExploreScreen(),
    TaskScreen(),
    ProfileScreen()
  ];

  void _onTabPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () async {
            var status = await Permission.camera.request();
            if (status.isGranted) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Camera permission granted!"))
              );
            } else if (status.isDenied) {
              await Permission.camera.request();
            } else if (status.isPermanentlyDenied) {
              openAppSettings();
            }
          },
          shape: CircleBorder(),
          backgroundColor: Colors.yellow,
          child: Icon(Icons.qr_code_scanner_rounded, size: 35,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // left nav
              Row(
                children: [
                  _buildNavItem("Home", Icons.home_outlined, 0),
                  _buildNavItem("Explore", Icons.explore_outlined, 1)
                ],
              ),

              //right nav
              Row(
                children: [
                  _buildNavItem("Task", Icons.task_alt_outlined, 2),
                  _buildNavItem("Profile", Icons.person_outline, 3)
                ],
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      )
    );
  }

  Widget _buildNavItem(
      String title, IconData icon, int index) {
    final isActive = _selectedIndex == index;
    final color = isActive ? Colors.green : Colors.black;

    return MaterialButton(
      onPressed: () => _onTabPressed(index),
      shape: CircleBorder(),
      child: Column(
          children: [
            Icon(icon, size: 30, color: color),
            Text(title,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: color
              )
            )
          ]
      ),
    );
  }
}
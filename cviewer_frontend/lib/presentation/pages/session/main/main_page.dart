import 'package:cviewer_frontend/presentation/pages/session/main/cvs/cvs_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/home/home_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/profile/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentTabIndex = 1;

  Widget _buildTab(BuildContext context) {
    switch (_currentTabIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const CVsPage();
      default:
        return const ProfilePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTab(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: (i) => setState(() => _currentTabIndex = i),
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Resume history',
            icon: Icon(
              Icons.history_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.account_circle_rounded,
            ),
          ),
        ],
      ),
    );
  }
}

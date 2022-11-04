import 'package:cviewer_frontend/presentation/screens/home/applicant_home_screen.dart';
import 'package:cviewer_frontend/presentation/screens/profile/applicant_profile_screen.dart';
import 'package:cviewer_frontend/presentation/screens/resume/applicant_review_history_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentTabIndex = 0;

  Widget _buildTab(BuildContext context) {
    switch (_currentTabIndex) {
      case 0:
        return const ApplicantHomeScreen();
      case 1:
        return const ApplicantReviewHistoryScreen();
      default:
        return const ApplicantProfileScreen();
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
            label: 'Review history',
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

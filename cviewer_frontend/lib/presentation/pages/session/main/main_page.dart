import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/cvs/cv_list_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/home/home_page.dart';
import 'package:cviewer_frontend/presentation/pages/session/main/profile/profile_page.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/tab_label_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/ui_models/tab_label_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentTabIndex = 1;
  late TabLabelUiModel _tabLabelUiModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = Provider.of<Profile?>(context);
    _tabLabelUiModel = TabLabelUiAdapter(context, profile: profile);
  }

  Widget _buildTab(BuildContext context) {
    switch (_currentTabIndex) {
      case 0:
        return HomePage(
          title: _tabLabelUiModel.homeLabel,
        );
      case 1:
        return CVListPage(
          title: _tabLabelUiModel.cvListLabel,
        );
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
        items: [
          BottomNavigationBarItem(
            label: _tabLabelUiModel.homeLabel,
            icon: const Icon(
              Icons.star_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: _tabLabelUiModel.cvListLabel,
            icon: const Icon(
              Icons.list_alt_rounded,
            ),
          ),
          BottomNavigationBarItem(
            label: S.of(context).profile,
            icon: const Icon(
              Icons.account_circle_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
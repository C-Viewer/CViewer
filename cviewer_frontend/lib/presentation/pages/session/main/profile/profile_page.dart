import 'package:cviewer_frontend/domain/logic/profile/profile_holder.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileHolder = ProfileHolder();

  @override
  void initState() {
    super.initState();
    _profileHolder.loadProfile();
  }

  Widget _buildContent(BuildContext context, Profile? profile) {
    return (profile != null)
        ? Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First name
                Text(
                  profile.firstName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                // Last name
                Text(
                  profile.lastName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                // Label
                Text(
                  'О себе',
                  style: Theme.of(context).textTheme.headline4,
                ),
                // Description
                Text(
                  profile.description,
                  style: Theme.of(context).textTheme.subtitle2,
                )
              ],
            ),
          )
        : const Center(
            child: Text('Error'),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => _buildContent(
          context,
          _profileHolder.profile,
        ),
      ),
    );
  }
}

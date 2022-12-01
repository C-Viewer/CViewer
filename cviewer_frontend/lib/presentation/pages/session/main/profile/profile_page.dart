import 'package:cviewer_frontend/presentation/widgets/profile/profile_provider.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ProfileProvider.of(context);

    return Scaffold(
      body: user != null
          ? Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // First name
                  Text(
                    user.firstName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  // Last name
                  Text(
                    user.lastName,
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
                    user.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              ),
            )
          : const Center(
              child: Text('Error'),
            ),
    );
  }
}

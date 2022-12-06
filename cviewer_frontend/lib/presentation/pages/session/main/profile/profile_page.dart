import 'package:cviewer_frontend/domain/logic/profile/profile_loader.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/ui_adapters/error_ui_adapter.dart';
import 'package:cviewer_frontend/presentation/widgets/loaders/default_loader.dart';
import 'package:cviewer_frontend/presentation/widgets/placeholders/load_error_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileLoader = ProfileLoader();

  @override
  void initState() {
    super.initState();
    _profileLoader.loadProfile();
  }

  void _onReload() {
    _profileLoader.loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (_) => coreErrorDisposer(
        context,
        (_) => _profileLoader.error,
      ),
      child: Scaffold(
        body: Observer(
          builder: (_) =>
              // Loading
              _profileLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _profileLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            error: _profileLoader.error,
                          ),
                          onReload: _onReload,
                        )
                      // Content
                      : _ProfileContent(
                          profile: _profileLoader.profile!,
                        ),
        ),
      ),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent({
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

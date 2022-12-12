import 'dart:math';

import 'package:cviewer_frontend/assets/strings/l10n.dart';
import 'package:cviewer_frontend/domain/logic/profile/profile_loader.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:cviewer_frontend/presentation/core/core_error_disposer.dart';
import 'package:cviewer_frontend/presentation/resources/app_colors.dart';
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
        appBar: AppBar(
          title: Text(S.of(context).profile),
          automaticallyImplyLeading: false,
        ),
        body: Observer(
          builder: (_) =>
              // Loading
              _profileLoader.isLoading
                  ? const DefaultLoader()
                  // Load error
                  : _profileLoader.hasLoadError
                      ? LoadErrorPlaceholder(
                          error: ErrorUiAdapter(
                            context,
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
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(32) + const EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First name
              _ProfilePropertyTile(
                title: S.of(context).firstName,
                property: profile.firstName,
              ),
              const _Separator(),
              // Last name
              _ProfilePropertyTile(
                title: S.of(context).lastName,
                property: profile.lastName,
              ),
              const _Separator(),
              // Speciality
              _ProfilePropertyTile(
                title: S.of(context).speciality,
                property: profile.speciality,
              ),
              const _Separator(),
              // Biography
              _ProfilePropertyTile(
                title: S.of(context).biography,
                property: profile.biography,
              ),
            ],
          ),
        ),
        // Button
        // const Positioned(
        //   bottom: 20,
        //   left: 0,
        //   right: 0,
        //   child: _Button(),
        // ),
      ],
    );
  }
}

class _ProfilePropertyTile extends StatelessWidget {
  const _ProfilePropertyTile({
    required this.title,
    required this.property,
  });

  final String title;
  final String property;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          title,
          style: Theme.of(context).textTheme.caption?.copyWith(
                fontSize: 18,
              ),
        ),
        const SizedBox(height: 12),
        // Property
        Text(
          property,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                fontSize: 22,
              ),
        ),
      ],
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
    );
  }
}

class _Button extends StatelessWidget {
  const _Button();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: min(MediaQuery.of(context).size.width * 0.5, 500),
        ),
        child: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.mint),
          ),
          child: Text(
            S.of(context).edit,
            style: const TextStyle(fontSize: 20),
          ),
          onPressed: () => {},
        ),
      ),
    );
  }
}

import 'package:cviewer_frontend/di/assemble.dart';
import 'package:cviewer_frontend/presentation/widgets/profile/profile_provider.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  final _profile = Assemble.profileRepository.getCachedProfile();

  @override
  Widget build(BuildContext context) {
    return (_profile != null)
        ? ProfileProvider(
            profile: _profile!,
            child: widget.child,
          )
        : widget.child;
  }
}

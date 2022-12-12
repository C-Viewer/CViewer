import 'package:cviewer_frontend/domain/logic/profile/profile_loader.dart';
import 'package:cviewer_frontend/domain/models/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
  final _profileLoader = ProfileLoader();
  Profile? _profile;

  @override
  void initState() {
    super.initState();
    _profileLoader.loadProfile();
  }

  ReactionDisposer _profileDisposer(BuildContext context) {
    return reaction(
      (_) => _profileLoader.profile,
      (profile) => setState(() => _profile = profile),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: _profileDisposer,
      child: Provider(
        create: (_) => _profileLoader,
        child: Provider.value(
          value: _profile,
          child: widget.child,
        ),
      ),
    );
  }
}
